import 'dart:async';

class CalculationBloc {
  String displayText, operation;
  double firstNo, secondNo;
  var result;
  bool dotClicked = false;
  bool equalToclicked = false;
  final StreamController<String> clickController = StreamController.broadcast();
  StreamController<String> displayController = StreamController.broadcast();

  Sink<String> get clickSink => clickController.sink;
  Sink<String> get displaySink => displayController.sink;

  Stream<String> get clickStream => clickController.stream;
  Stream<String> get displayStream => displayController.stream;

  CalculationBloc() {
    clickStream.listen(calculate);
  }

  void calculate(String event) {
    if (displayText == "0" &&
        event != "+" &&
        event != "-" &&
        event != "x" &&
        event != "/" &&
        event != "backspace" &&
        event != "/" &&
        event != "+/-") {
      result = event;
    } else
      result = (displayText + event);
    if (equalToclicked) {
      if (event == "+" ||
          event == "-" ||
          event == "x" ||
          event == "/" ||
          event == "backspace" ||
          event == "/" ||
          event == "+/-") {
      } else {
        displayText = "";
        equalToclicked = false;
        dotClicked =false;
      }
    }
    if (event == "+/-") {
      dotClicked =false;
      equalToclicked = false;
      if (displayText == "0") {
        result = "0";
      } else {
        double value = double.parse(displayText);
        value = -(value);
        result = value.toString();
      }
    }
    if (event == ".") {
      dotClicked =true;

      if (displayText.contains(".") == true) {
        result = (displayText);
      } else
        result = (displayText + event);
    }
    if (event == "backspace") {
      dotClicked =false;
      if (displayText != "0") {
        if (displayText == "Infinity" ||
            displayText == "infinity" ||
            displayText == "-Infinity" ||
            displayText == "-infinity" ||
            displayText == "NaN") {
          result = displayText;
        } else
          result = displayText.substring(0, displayText.length - 1);
      } else
        result = "0";
    }
    if (event == "AC") {
      result = "0";
      dotClicked =false;
    }
    if (event == "+" || event == "-" || event == "x" || event == "/") {
      // displayText.replaceAll(new RegExp(r'+'), '');
      // displayText.replaceAll(new RegExp(r'-'), '');
      // displayText.replaceAll(new RegExp(r'X'), '');
      // displayText.replaceAll(new RegExp(r'/'), '');
      // displayText.replaceAll(new RegExp(r'='), '');
      firstNo = double.parse(displayText);
      // displaySink.add("0");
      result = "0";
      dotClicked =false;
      operation = event;
    }
    if (event == "=") {
      displayText.replaceAll("=", "0");
      result = displayText;
      if (firstNo != null) {
        equalToclicked = true;
        secondNo = double.parse(displayText);
        switch (operation) {
          case '+':
            result = (firstNo + secondNo);
            break;
          case "-":
            result = firstNo - secondNo;
            break;
          case "x":
            result = firstNo * secondNo;
            break;
          case "/":
            result = firstNo / secondNo;
            break;
          default:
        }
        firstNo = null;
        secondNo = null;
        operation = null;
        dotClicked =false;
      }
    }

    // if(double.parse(result.toString()) is double)
    // {
    //   if((double.parse(result.toString()))%2 == 0){
    //     result = int.parse(result.toString());
    //   }
    // }

    int length = result.toString().length;
    if (result.toString().endsWith(".0")) {
      if(!dotClicked){
         if (!result.toString().startsWith("0.")) {
        result = result.toString().substring(0, length - 2);
      }
      }
     
    }

    displaySink.add(result.toString());

    // displaySink.add(displayText + event);
  }

  void dispose() {
    clickController.close();
    displayController.close();
  }
}
