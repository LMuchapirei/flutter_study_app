import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
    color: UIParameters.isDarkMode()
        ? Theme.of(context).textTheme.bodyText1!.color
        : Theme.of(context).primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold);
const detailTextStyle = TextStyle(fontSize: 12);