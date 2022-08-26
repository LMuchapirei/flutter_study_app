import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({Key? key, this.addPadding = true, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        child: child,
        padding: addPadding
            ? EdgeInsets.only(
                left: mobileScreenPadding,
                right: mobileScreenPadding,
                top: mobileScreenPadding)
            : EdgeInsets.zero,
        decoration: BoxDecoration(color: customScaffoldColor(context)),
      ),
    );
  }
}
