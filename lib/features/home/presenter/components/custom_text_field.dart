import 'package:contacts/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  new({
    super.key,
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.validator,
  });
  String hint;
  TextEditingController controller;
  Function(String? value) validator;
  Function(String? value) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      onChanged: (value) {
        onChanged(value);
      },
      controller: controller,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),

        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!
            .copyWith(color: AppColors.hintText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColors.primary, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          borderSide: BorderSide(color: AppColors.error, width: 1.0),
        ),
      ),
    );
  }
}
