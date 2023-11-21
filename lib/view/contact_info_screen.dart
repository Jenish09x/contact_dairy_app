import 'dart:io';

import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:contact_dairy_app/widget/alert_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/contact_provider.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  ContactProvider? providerW;
  ContactProvider? providerR;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<ContactProvider>();
    providerR = context.read<ContactProvider>();
    ContactModel c1 =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                (c1.image == null)
                    ? CircleAvatar(
                        radius: 70,
                        child: Text(
                          "${c1.name?.substring(0, 1).toUpperCase()}",
                          style: const TextStyle(fontSize: 50),
                        ),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(File("${c1.image}")),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${c1.name}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(onTap: () async {
                      Uri uri =Uri.parse("tel:+91${c1.contact}");
                      await launchUrl(uri);
                    },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.sizeOf(context).width * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Call"),
                          ],
                        ),
                      ),
                    ),
                    InkWell(onTap: () async {
                      Uri uri =Uri.parse("sms:+91${c1.contact}");
                      await launchUrl(uri);
                    },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.sizeOf(context).width * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.message),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Message"),
                          ],
                        ),
                      ),
                    ),
                    InkWell(onTap: () async {
                      Uri uri =Uri.parse("mailto:${c1.email}");
                      await launchUrl(uri);
                    },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.sizeOf(context).width * 0.30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Email"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).width * 0.35,
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.call_outlined,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${c1.contact}",
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                  const Text(
                                    "Mobile | India",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${c1.email}",
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                  const Text(
                                    "Email",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 340,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            providerR!.isPrivate;
                            if(providerR!.isPrivate)
                            {
                              providerR!.unHideContact();
                            }
                            else{
                              providerR!.hideContact();
                            }
                            Navigator.pop(context);
                          },
                          icon: providerR!.isPrivate
                              ? const Icon(Icons.remove_red_eye)
                              :  const Icon(CupertinoIcons.eye_slash),
                        ),
                        IconButton(
                            onPressed: () {
                              showWidget(context, c1);
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            onPressed: () {
                              providerR!.deleteData();
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.delete_outline)),
                        IconButton(
                            onPressed: (){
                              providerR!.shareData(c1);
                            }, icon: const Icon(Icons.share)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.more_vert)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}