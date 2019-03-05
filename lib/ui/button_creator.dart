import 'package:flutter/material.dart';
import 'package:calc_example/provider/bloc_provider.dart';
import 'package:calc_example/bloc/calculationbloc.dart';

class ButtonCreator extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Border border;
  Color textColor;
  int flex;
  FontWeight fontWeight;
  CalculationBloc calcBloc;
  ButtonCreator(String buttonText) {
    this.buttonText = buttonText;
    if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/" ||
        buttonText == "=") {
      buttonColor = Colors.orangeAccent;
      textColor = Colors.white;
      fontWeight = FontWeight.w300;
    } else
      fontWeight = FontWeight.w200;
    if (buttonText == "AC" ||
        buttonText == "+/-" ||
        buttonText == "backspace") {
      buttonColor = Colors.grey[300];
    }
    if (buttonText == "0") {
      flex = 2;
    } else
      flex = 1;

    border = Border.all(width: 0.5);
  }
  @override
  Widget build(BuildContext context) {
    calcBloc = CalcBlocProvider.of(context).bloc;
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(border: border),
        child: FlatButton(
          color: buttonColor,
          child: buttonText == "backspace"
              ? Container(
                  padding: EdgeInsets.all(18),
                  child: Opacity(
                    child: Image.asset("assets/backspace.png"),
                    opacity: 0.5,
                  ),
                )
              : Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: fontWeight,
                  ),
                ),
          onPressed: () {
            calcBloc.clickSink.add(buttonText);
          },
        ),
      ),
    );
  }
}
