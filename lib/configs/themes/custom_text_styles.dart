import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';

TextStyle cartTitles(context) => TextStyle(
  color: UIParameters.isDarkMode(context) ? Theme.of(context).textTheme.bodyText1!.color : Theme.of(context).primaryColor,
  fontSize: 18,
  fontWeight: FontWeight.bold
);

const detailText = TextStyle(fontSize: 12);
const headerText = TextStyle(fontSize:  22, fontWeight: FontWeight.w700,
color: onSurfaceTextColor);