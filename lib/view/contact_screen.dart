import 'dart:io';

import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:contact_dairy_app/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;

  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Add Contacts",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Consumer<ContactProvider>(
                builder: (context, value, child) => Stepper(
                  currentStep: value.stepIndex,
                  onStepContinue: () {
                    value.nextStep();
                  },
                  onStepCancel: () {
                    value.backStep();
                  },
                  steps: [
                    Step(
                      title: const Text("Add Image"),
                      content: Column(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: value.path != null
                                ? FileImage(File(value.path!))
                                : null,
                          ),
                          IconButton(
                              onPressed: () async {
                                ImagePicker imgPiker = ImagePicker();
                                XFile? image = await imgPiker.pickImage(
                                    source: ImageSource.gallery);
                                providerr!.updateImagePath(image!.path);
                              },
                              icon: const Icon(Icons.image))
                        ],
                      ),
                    ),
                    Step(
                      title: const Text("Add Name"),
                      content: TextField(
                        controller: txtName,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Name"),
                        ),
                      ),
                    ),
                    Step(
                      title: const Text("Add Contact Number"),
                      content: TextField(
                        controller: txtContact,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Number"),
                        ),
                      ),
                    ),
                    Step(
                      title: const Text("Add Email"),
                      content: TextField(
                        controller: txtEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Enter Email"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  ContactModel cm = ContactModel(
                      contact: txtContact.text,
                      email: txtEmail.text,
                      image: providerr!.path,
                      name: txtName.text);
                  providerr!.resetStep();
                  providerr!.addContact(cm);
                  Navigator.pop(context);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}