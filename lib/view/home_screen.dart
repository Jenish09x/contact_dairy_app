import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/contact_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ContactProvider? providerw;
  ContactProvider? providerr;

  @override
  Widget build(BuildContext context) {
    providerw = context.watch<ContactProvider>();
    providerr = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
              const Text(
                " 1 contacts",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: providerw!.contactList.length,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                      providerr!.storeInde(index);
                      Navigator.pushNamed(context, "contactInfo",arguments: providerr!.contactList[index]);
                    },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.10,
                        width: MediaQuery.of(context).size.width * 0.10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            providerw!.contactList[index].image != null?
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: FileImage(File(
                                  "${providerw!.contactList[index].image}"),
                              ),
                            ):
                            Container(
                              width: MediaQuery.of(context).size.width * 0.13,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white24),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${providerw!.contactList[index].name!.substring(0, 1)}",style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Text("${providerr!.contactList[index].name}",style: const TextStyle(fontSize: 20),)
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
