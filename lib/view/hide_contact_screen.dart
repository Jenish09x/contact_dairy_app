import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';

class HideContactScreen extends StatefulWidget {
  const HideContactScreen({super.key});

  @override
  State<HideContactScreen> createState() => _HideContactScreenState();
}
    ContactProvider? providerW;
    ContactProvider? providerR;
class _HideContactScreenState extends State<HideContactScreen> {
  @override
  Widget build(BuildContext context) {
    providerW = context.watch<ContactProvider>();
    providerR = context.read<ContactProvider>();
    return  SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: providerW!.hideContactList.length,
          itemBuilder: (context, index) {
            return InkWell(onTap: () {
              providerR!.storeIndex(index);
              Navigator.pushNamed(context, "contactInfo",arguments: providerR!.hideContactList[index]);
            },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width * 0.10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    providerW!.hideContactList[index].image != null?
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: FileImage(File(
                          "${providerW!.hideContactList[index].image}"),
                      ),
                    ): CircleAvatar(
                      radius: 25,
                      child: Text(providerW!.hideContactList[index].name!.substring(0, 1).toUpperCase(),style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Text("${providerR!.hideContactList[index].name}",style: const TextStyle(fontSize: 20),)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}