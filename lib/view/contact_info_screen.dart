import 'dart:io';

import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:contact_dairy_app/widget/alert_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';

class ContactInfoScreen extends StatefulWidget {
  const ContactInfoScreen({super.key});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;
  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    ContactModel c1 =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),
              // providerw!.contactList[index].image != null?
               CircleAvatar(
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.sizeOf(context).width * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.sizeOf(context).width * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.sizeOf(context).width * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.videocam),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Video"),
                      ],
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
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.call_outlined),
                            const SizedBox(width: 10,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${c1.contact}"),
                                const Text("Mobile | India",style: TextStyle(fontSize: 11),),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.email_outlined),
                            const SizedBox(width: 10,),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${c1.email}"),
                                const Text("Email",style: TextStyle(fontSize: 11),),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 340,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.star)),
                      IconButton(onPressed: () {
                        showWidget(context,c1);
                      }, icon: const Icon(Icons.edit_outlined)),
                      IconButton(onPressed: () {
                        providerr!.deleteData();
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.delete_outline)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
