import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:flutter/material.dart';
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
        alignment: Alignment.bottomCenter,
        title: const Text("Update Contacts"),
        actions: [
          TextField(
            controller: txtName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Name")
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
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
           ContactModel c1 = ContactModel();
           c1.name=txtName.text;
           c1.contact=txtContact.text;
           c1.email=txtEmail.text;
           context.read<ContactProvider>().editData(c1);
            Navigator.pop(context);
            Navigator.pop(context);
          },child: const Text("Update"),)
        ],
      );
    },
  );
}
