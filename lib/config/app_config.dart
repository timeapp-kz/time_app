import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
class AppConfig extends InheritedWidget{

  AppConfig({
    @required Widget child,
  }) : super(child: child);

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}