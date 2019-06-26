import 'package:flutter/material.dart';

import 'package:time_app/screens/home/home_screen.dart';
import 'package:time_app/screens/authorization/authorization_screen.dart';

void main() => runApp(TimeApp());

class TimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: AuthorizationScreen(),
    );
  }
}
