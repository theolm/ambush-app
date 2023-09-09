import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.textInputAction,
    this.validator,
    this.autovalidateMode,
    this.maxLines,
    this.minLines,
    this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
  });

  final String label;
  final String? hintText;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        suffixIcon: IconButton(
          onPressed: (){
            controller.clear();
          },
          icon: SvgPicture.asset('assets/icons/ic_clear.svg'),
        ),
      ),
      textInputAction: textInputAction,
      validator: validator,
      autovalidateMode: autovalidateMode,
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
