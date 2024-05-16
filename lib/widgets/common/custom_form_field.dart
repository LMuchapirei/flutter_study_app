import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class CustomFormField extends StatelessWidget {

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  const CustomFormField({
    Key? key,
    this.inputFormatters,
    this.validator,
    this.onChange,
    required this.hintText
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIParameters.mobileScreenPadding,
      child: TextFormField(
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: UIParameters.inputDecoration(hintText: hintText),
        onChanged: onChange,
      ),

    );
  }
}