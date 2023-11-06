// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<UserRolesRecord?> getRolesByUser(DocumentReference userRef) async {
  // Add your function code here!
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('user_roles')
      .where('user', isEqualTo: userRef)
      .get();

  if (snapshot.docs.isNotEmpty) {
    return UserRolesRecord.fromSnapshot(snapshot.docs.first);
  }

  return null;
}
