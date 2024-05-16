import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';

class CustomFormField extends StatelessWidget {

  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;
  final TextInputType? textInputType;
  final bool requiresPadding;
  final void Function(String?)? onSaved;
  const CustomFormField({
    Key? key,
    this.inputFormatters,
    this.validator,
    this.onChange,
    this.onSaved,
    this.textInputType,
    required this.hintText,
    this.requiresPadding = true
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: requiresPadding ? UIParameters.mobileScreenPadding: EdgeInsets.all(0),
      child: TextFormField(
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        validator: validator,
        decoration: UIParameters.inputDecoration(hintText: hintText),
        onChanged: onChange,
        onSaved: onSaved,
      ),

    );
  }
}