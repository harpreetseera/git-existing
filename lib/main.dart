import 'package:calc_example/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown,DeviceOrientation.portraitUp]);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'CAL C',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}