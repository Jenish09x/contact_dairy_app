import 'package:contact_dairy_app/model/contact_model.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';

class ContactProvider with ChangeNotifier {
  int stepIndex = 0;
  String? path;
  List<ContactModel> contactList = [];
  int? addIndex;
  int countIndex = 0;
  bool? isPrivate;
  List<ContactModel> hideContactList = [];

  //NextStep Stepper
  void nextStep() {
    if (stepIndex < 3) {
      stepIndex++;
    }
    notifyListeners();
  }

  //backStep Stepper
  void backStep() {
    if (stepIndex > 0) {
      stepIndex--;
    }
    notifyListeners();
  }

  //image
  void updateImagePath(String? newPath) {
    path = newPath;
    notifyListeners();
  }

  //Contact add to List
  void addContact(ContactModel cm) {
    contactList.add(cm);
    notifyListeners();
  }

  //reset Step
  void resetStep() {
    stepIndex = 0;
    notifyListeners();
  }

  //edit data
  void editData(ContactModel c1) {
    contactList[addIndex!] = c1;
    notifyListeners();
  }

  //storeIndex
  void storeIndex(int index) {
    addIndex = index;
    notifyListeners();
  }

  //counter
  void counter(int index) {
    countIndex = index;
    notifyListeners();
  }

  //delete data
  void deleteData() {
    contactList.removeAt(addIndex!);
    notifyListeners();
  }

  //share
  Future<void> shareData(ContactModel cm) async {
    Share.share("${cm.name}\n${cm.contact}");
  }

  //hide
  void hideContact() {

    ContactModel hiddenContact = contactList[addIndex!];
    hideContactList.add(hiddenContact);
    contactList.removeAt(addIndex!);
    notifyListeners();
  }

  //unHide
  void unHideContact() {
    ContactModel unHideContact = hideContactList[addIndex!];
    contactList.add(unHideContact);
    hideContactList.removeAt(addIndex!);
    notifyListeners();
  }

  //bioMatrix
  Future<bool?> bioMatrix() async {
    LocalAuthentication auth = LocalAuthentication();
    bool checkBioMatrixStatus = await auth.canCheckBiometrics;
    if (checkBioMatrixStatus) {
      List<BiometricType> biotypes = await auth.getAvailableBiometrics();
      if (biotypes.isNotEmpty) {
        bool isAuth = await auth.authenticate(
          localizedReason: "Hi",
          options: const AuthenticationOptions(
              biometricOnly: false, useErrorDialogs: true),
        );
        return isAuth;
      }
    }
    return null;
  }


}