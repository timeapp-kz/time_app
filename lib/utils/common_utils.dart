import 'package:flutter/material.dart';

import 'package:time_app/resources/values/app_dimensions.dart';


double screenAwareHeight(double height, BuildContext context) {
  return height * MediaQuery.of(context).size.height / AppDimensions.baseHeight;
}

double screenAwareWidth(double width, BuildContext context) {
  return width * MediaQuery.of(context).size.width / AppDimensions.baseWidth;
}