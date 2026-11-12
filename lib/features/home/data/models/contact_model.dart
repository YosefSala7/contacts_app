import 'dart:io';

class ContactModel {
  static int id = 1;
  File img;
  String name;
  String phone;
  String gmail;
  ContactModel({
    required this.img,
    required this.name,
    required this.phone,
    required this.gmail,
  }) {
    ContactModel.id = ContactModel.id++;
  }
}

List<ContactModel> contacts = [];
