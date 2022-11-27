import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:get/get.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {Key? key,
      this.title = "",
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color})
      : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
            onTap: enabled == false ? null : onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color ?? Theme.of(context).cardColor,
              ),
              width: double.maxFinite,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: child ??
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? onSurfaceTextColor
                                : Theme.of(context).primaryColor),
                      ),
                    ),
              ),
            )),
      ),
    );
  }
}
