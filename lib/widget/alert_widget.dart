import 'dart:io';

import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';


void showWidget(BuildContext context,ContactModel c1) {
  TextEditingController txtName = TextEditingController(text: c1.name);
  TextEditingController txtContact = TextEditingController(text: c1.contact);
  TextEditingController txtEmail = TextEditingController(text: c1.email);
  showDialog(
    context: context,
    builder: (context) {
      return  AlertDialog(
        title: const Text("Update Contacts"),
        actions: [
          InkWell(
            onTap: () async {
              ImagePicker picker = ImagePicker();
              XFile? image =
              await picker.pickImage(source: ImageSource.gallery);
              context.watch<ContactProvider>().updateImagePath(image!.path);
            },
            child: Align(
              alignment: Alignment.center,
              child: c1.image == null
                  ? CircleAvatar(
                radius: 50,
                child: Text("${c1.name?.substring(0, 1).toUpperCase()}"),
              )
                  : CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File("${c1.image}")),
              ),
            ),
          ),
          TextField(
            controller: txtName,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name")
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.number,
            controller: txtContact,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Contact")
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtEmail,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email")
            ),
          ),
          const SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            ContactModel cm = ContactModel(image: c1.image,name: txtName.text,contact: txtContact.text,email: txtEmail.text);
            // c1.name=txtName.text;
            // c1.contact=txtContact.text;
            // c1.email=txtEmail.text;
            context.read<ContactProvider>().editData(cm);
            Navigator.pop(context);
            Navigator.pop(context);
          },child: const Text("Update"),),
        ],
      );
    },
  );
}