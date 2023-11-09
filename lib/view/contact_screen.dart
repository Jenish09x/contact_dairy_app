import 'dart:io';

import 'package:contact_dairy_app/widget/alert_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  ContactProvider? providerW;
  ContactProvider? providerR;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<ContactProvider>();
    providerR = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {
            // providerR!.bioMatrix();
            // Navigator.pushNamed(context, "hideScreen");
          }, icon: const Icon(CupertinoIcons.eye_fill)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search,color: Colors.black,),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert,color: Colors.black,),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Text(
                "Contacts",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "${providerW!.countIndex} contacts",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: providerW!.contactList.length,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      providerR!.counter(index);
                      providerR!.storeIndex(index);
                      Navigator.pushNamed(context, "contactInfo",arguments: providerR!.contactList[index]);
                    },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            providerW!.contactList[index].image != null ? CircleAvatar(
                              radius: 25,
                              backgroundImage: FileImage(File(
                                  "${providerW!.contactList[index].image}"),
                              ),
                            ): CircleAvatar(
                              radius: 25,
                                  child: Text("${providerW!.contactList[index].name?.substring(0, 1).toUpperCase()}",style: const TextStyle(fontSize: 20),
                                  ),
                              ),
                            const SizedBox(width: 20,),
                            Text("${providerR!.contactList[index].name}",style: const TextStyle(fontSize: 20),)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.lightGreen,
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pushNamed(context, "contact");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}