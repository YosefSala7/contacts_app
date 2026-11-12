import 'package:contacts/features/home/presenter/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    super.key,
    required this._formKey,
    required this.emailController,
    required this.nameController,
    required this.phoneController,
    required this.emailOnChanged,
    required this.emailValidator,
    required this.nameOnChanged,
    required this.nameValidator,
    required this.phoneOnChanged,
    required this.phoneValidator,
  });
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  final _formKey;
  Function(String? value) nameValidator;
  Function(String? value) nameOnChanged;
  Function(String? value) emailValidator;
  Function(String? value) emailOnChanged;
  Function(String? value) phoneValidator;
  Function(String? value) phoneOnChanged;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 8,
        children: [
          CustomTextField(
            hint: "Enter User Name",
            controller: nameController,
            onChanged: nameOnChanged,
            validator: nameValidator,
          ),
          CustomTextField(
            hint: "Enter User Email",
            controller: emailController,
            onChanged: emailOnChanged,
            validator: emailValidator,
          ),
          CustomTextField(
            hint: "Enter User Phone",
            controller: phoneController,
            onChanged: phoneOnChanged,
            validator: phoneValidator,
          ),
        ],
      ),
    );
  }
}
