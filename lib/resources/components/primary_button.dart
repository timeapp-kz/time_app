import 'package:flutter/material.dart';

import 'package:time_app/utils/common_utils.dart';

// Main button style that is used across most of the screens (Send SMS, Login, etc...)
class PrimaryButton extends StatelessWidget {
  List<double> gradientStops;
  List<Color> gradientColors;
  String buttonText;
  Function onPressed;
  double height;
  double width;

  PrimaryButton(
      {@required this.gradientStops,
        @required this.gradientColors,
        @required this.buttonText,
        @required this.onPressed, this.height, this.width});


  @override
  Widget build(BuildContext context) {
    final borderRadius = screenAwareHeight(16.0, context);

    return Container(
      height: height == null ? screenAwareHeight(83.25, context) : height,
      width: width == null ? screenAwareWidth(501.25, context) : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: gradientStops,
          colors: gradientColors,
        ),
      ),
      child: FlatButton(
        color: Colors.transparent,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenAwareHeight(40, context)),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
      ),
    );
  }
}
