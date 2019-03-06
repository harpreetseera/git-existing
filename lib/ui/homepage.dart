import 'package:calc_example/bloc/calculationbloc.dart';
import 'package:calc_example/ui/button_creator.dart';
import 'package:flutter/material.dart';
import 'package:calc_example/provider/bloc_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String displayText = "0";
  CalculationBloc calcBloc;
  @override
  void initState() {
    calcBloc = CalculationBloc();
    calcBloc.displaySink.add("0");
    super.initState();
  }

  @override
  void dispose() {
    calcBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CalcBlocProvider(
      bloc: calcBloc,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.black,
                            child: StreamBuilder(
                              initialData: "0",
                              stream: calcBloc.displayStream,
                              builder: (context, snapshot) {
                                calcBloc.displayText = snapshot.data;
                                // return Text(
                                //   snapshot.data,
                                //   textAlign: TextAlign.end,
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 70,
                                //       fontWeight: FontWeight.w200),
                                // ),
                                return AutoSizeText(
                                  snapshot.data,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w200),
                                 maxLines: 3,
                                 maxFontSize: 70,
                                 minFontSize: 20,
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  flex: 9,
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ButtonCreator('AC'),
                              ButtonCreator('+/-'),
                              ButtonCreator('backspace'),
                              ButtonCreator('/'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ButtonCreator('7'),
                              ButtonCreator('8'),
                              ButtonCreator('9'),
                              ButtonCreator('x'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ButtonCreator('4'),
                              ButtonCreator('5'),
                              ButtonCreator('6'),
                              ButtonCreator('-'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ButtonCreator('1'),
                              ButtonCreator('2'),
                              ButtonCreator('3'),
                              ButtonCreator('+'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ButtonCreator('0'),
                              ButtonCreator('.'),
                              ButtonCreator('='),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
