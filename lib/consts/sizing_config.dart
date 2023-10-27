import 'package:flutter/cupertino.dart';

double verticalConverter(BuildContext context, double value) {
  double height = MediaQuery.of(context).size.height;
  double heightRatio = height / 812;
  double newValue = heightRatio * value;
  return newValue;
}

double horizontalConverter(BuildContext context, double value) {
  double width = MediaQuery.of(context).size.width;
  double widthRatio = width / 375;
  double newValue = widthRatio * value;
  return newValue;
}