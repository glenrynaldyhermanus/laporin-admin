// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> checkIsAdmin(List<DocumentReference> roles) async {
  // check if array of roles contains x1kiLxetx5IrirK2nVth then return true or else return false
  bool isAdmin = false;
  for (DocumentReference role in roles) {
    DocumentSnapshot roleSnapshot = await role.get();
    if (roleSnapshot.id == 'x1kiLxetx5IrirK2nVth') {
      isAdmin = true;
      break;
    }
  }
  return isAdmin;
}
