import 'dart:io';

import 'package:contacts/core/app_colors.dart';
import 'package:contacts/core/gen/assets.gen.dart';
import 'package:contacts/features/home/data/models/contact_model.dart';
import 'package:contacts/features/home/presenter/components/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class CustomBottomSheet {
  final BuildContext context;
  Function onClose;
  CustomBottomSheet.show({required this.context,required this.onClose}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BottomSheetContent();
      },
    ).then((value){
      onClose();
    });
  }
}

class BottomSheetContent extends StatefulWidget {
  BottomSheetContent({super.key});
  @override
  State<BottomSheetContent> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<BottomSheetContent> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String name = "User Name";
  String phone = "example@email.com";
  String email = "+200000000000";
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    name = nameController.text.isNotEmpty ? nameController.text : "User Name";
    email = emailController.text.isNotEmpty
        ? emailController.text
        : "example@email.com";
    phone = phoneController.text.isNotEmpty
        ? phoneController.text
        : "+200000000000";
  }

  Future<void> imagePicker(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: .min,
        spacing: 16,
        children: [
          Row(
            spacing: 5,
            children: [
              GestureDetector(
                onTap: () {
                  imagePicker(ImageSource.gallery);
                },
                child: Container(
                  clipBehavior: .hardEdge,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: selectedImage != null
                      ? Image.file(
                          selectedImage!,
                          fit: .cover,
                          width: double.infinity,
                        )
                      : LottieBuilder.asset(
                          Assets.lotties.imagePicker,
                          width: 150,
                          height: 150,
                        ),
                ),
              ),
              Expanded(
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: Theme.of(context).textTheme.bodyLarge),
                    Divider(
                      color: AppColors.primary,
                      thickness: 1.0,
                      height: 1,
                    ),
                    Text(email, style: Theme.of(context).textTheme.bodyLarge),
                    Divider(
                      color: AppColors.primary,
                      thickness: 1.0,
                      height: 1,
                    ),
                    Text(phone, style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
          CustomFormField(
            formKey: _formKey,
            emailOnChanged: (value) {
              setState(() {
                email = value!.isNotEmpty ? value : "example@email.com";
              });
            },
            nameOnChanged: (value) {
              setState(() {
                name = value!.isNotEmpty ? value : "User Name";
              });
            },
            phoneOnChanged: (value) {
              setState(() {
                phone = value!.isNotEmpty ? value : "+200000000000";
              });
            },
            nameValidator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Name is required";
              }
              return null;
            },
            emailValidator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Email is required";
              } else if (!value.contains('@')) {
                return "Enter a valid email";
              }
              return null;
            },
      
            phoneValidator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Phone is required";
              } else if (value.length < 11) {
                return "Phone must be 11 digits";
              }
              return null;
            },
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  selectedImage != null) {
                Navigator.pop(context);
                setState(() {
                  contacts.add(
                    ContactModel(
                      img: selectedImage!,
                      name: nameController.text,
                      phone: phoneController.text,
                      gmail: emailController.text,
                    ),
                  );
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(.infinity, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              "Enter user",
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(color: AppColors.surface),
            ),
          ),
        ],
      ),
    );
  }
}
