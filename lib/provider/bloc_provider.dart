import 'dart:async';
import 'package:calc_example/bloc/calculationbloc.dart';
import 'package:flutter/material.dart';

class CalcBlocProvider extends InheritedWidget{
  final CalculationBloc bloc;
  final Widget child;
  CalcBlocProvider({this.bloc,this.child}):super(child:child);
  static CalcBlocProvider of(BuildContext context)=>
  context.inheritFromWidgetOfExactType(CalcBlocProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}