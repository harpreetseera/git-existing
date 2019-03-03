
import 'dart:async';

class CalculationBloc {
  String displayText, operation;
  double firstNo, secondNo;
  var result;
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
     
      result = (displayText + event);
    if (equalToclicked) {
      if (event == "+" || event == "-" || event == "x" || event == "/" ||event == "backspace" || event == "/") {

      } else {
        displayText = "";
        equalToclicked = false;
      }
    } if (event =="+/-"){
      equalToclicked =false;
      double value =double.parse(displayText);
      value = -(value);
      result = value.toString();
    }
     if(event =="."){
      if(displayText.contains(".")==true){
         result = (displayText);
      }else result = (displayText+event);
    }
    if(event == "backspace"){
      result = displayText.substring(0,displayText.length-1);
    }
    if (event == "AC") {
      result = "0";
    } if (event == "+" || event == "-" || event == "x" || event == "/") {
      // displayText.replaceAll(new RegExp(r'+'), '');
      // displayText.replaceAll(new RegExp(r'-'), '');
      // displayText.replaceAll(new RegExp(r'X'), '');
      // displayText.replaceAll(new RegExp(r'/'), '');
      // displayText.replaceAll(new RegExp(r'='), '');
      firstNo = double.parse(displayText);
      // displaySink.add("0");
      result = "0";
      operation = event;
    }  if (event == "=") {
      displayText.replaceAll("=","0");
      result =displayText;
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
      }
    }

    // if((double.parse(result.toString()))%2 == 0){
    //   result = int.parse(result);
    // }
    displaySink.add(result.toString());

    // displaySink.add(displayText + event);
  }

  void dispose() {
    clickController.close();
    displayController.close();
  }
}
