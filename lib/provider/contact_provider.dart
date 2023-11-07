

import 'package:contact_dairy_app/model/contact_model.dart';

import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier{
  int stepIndex=0;
  String? path;
  List<ContactModel>contactList=[];
  int? addIndex;

  //NextStep Stepper
  void nextStep(){
    if(stepIndex<3)
      {
        stepIndex++;
      }
    notifyListeners();
  }

  //backStep Stepper
  void backStep(){
    if(stepIndex>0)
    {
      stepIndex--;
    }
    notifyListeners();
  }

  //image
  void updateImagePath(String newpath){
    path = newpath;
    notifyListeners();
  }

  //Contact add to List
  void addContact(ContactModel cm)
  {
      contactList.add(cm);
      notifyListeners();
  }

  //reset Step
 void resetStep()
 {
   stepIndex=0;
   notifyListeners();
 }

 void editData(ContactModel c1)
 {
   contactList[addIndex!]=c1;
   notifyListeners();
 }
 void storeInde(int index)
 {
   addIndex=index;
   notifyListeners();
 }

 void deleteData(){
    contactList.removeAt(addIndex!);
    notifyListeners();
 }

}