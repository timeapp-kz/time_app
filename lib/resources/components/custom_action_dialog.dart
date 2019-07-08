import 'package:flutter/material.dart';


import 'package:time_app/utils/common_utils.dart';
import 'package:time_app/resources/values/app_colors.dart';
import 'package:time_app/resources/values/app_dimensions.dart';

class CustomActionDialog extends StatelessWidget {
  final String title;
  final Function onPressed;
  final String cancelOptionText;
  final String confirmOptionText;

  CustomActionDialog({@required this.title, @required  this.onPressed, @required this.cancelOptionText, @required this.confirmOptionText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.actionDialogRadius)),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: screenAwareHeight(44, context),
            color: Theme.of(context).textTheme.body2.color),
      textAlign: TextAlign.center,),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlatButton(
            child: Text(
              cancelOptionText,
              style: TextStyle(
                  fontSize: screenAwareHeight(36, context),
                  color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          FlatButton(
            child: Text(
              confirmOptionText,
              style: TextStyle(
                  fontSize: screenAwareHeight(36, context),
                  color: Colors.green),
            ),
            onPressed: onPressed,
          ),
        ],
      ),

    );
  }
}
