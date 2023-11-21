import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/shared_helper.dart';

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
          leading: IconButton(onPressed: () async{
            bool? isPrivate= await providerR!.bioMatrix();
            if(isPrivate!=null || isPrivate==true)
              {
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, "hideScreen");
              }
          }, icon: const Icon(CupertinoIcons.eye_fill),),
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, value, child) => Switch(
                value: value.isLight,
                onChanged: (value1) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value1);
                  value.changeTheme();
                },
              ),
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
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                " ${providerW!.countIndex} contacts",
                style: const TextStyle(
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
                      Navigator.pushNamed(
                          context, "contactInfo", arguments: providerR!
                          .contactList[index]);
                    },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.10,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            providerW!.contactList[index].image != null
                                ? CircleAvatar(
                              radius: 25,
                              backgroundImage: FileImage(File(
                                  "${providerW!.contactList[index].image}"),
                              ),
                            )
                                : CircleAvatar(
                              radius: 25,
                              child: Text("${providerW!.contactList[index].name
                                  ?.substring(0, 1).toUpperCase()}",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Text("${providerR!.contactList[index].name}",
                              style: const TextStyle(fontSize: 20),)
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
            providerR!.isPrivate=false;
            Navigator.pushNamed(context, "contact");
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}