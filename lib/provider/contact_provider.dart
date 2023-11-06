

import 'package:contact_dairy_app/model/contact_model.dart';

import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier{
  int stepIndex=0;
  String? path;
  List<ContactModel>contactList=[];
  int? removeIndex;

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
   contactList.add(c1);
   notifyListeners();
 }

 void deleteData(){
    contactList.removeAt(removeIndex!);
    notifyListeners();
 }

}