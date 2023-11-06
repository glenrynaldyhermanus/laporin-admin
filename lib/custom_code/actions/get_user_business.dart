// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<BusinessRecord>?> getUserBusiness(DocumentReference userRef) async {
  // get list of business where owner eq to userRef return list of document if exists or else return null
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('business')
      .where('owner', isEqualTo: userRef)
      .get();
  if (snapshot.docs.isNotEmpty) {
    List<BusinessRecord> businesses =
        snapshot.docs.map((doc) => BusinessRecord.fromSnapshot(doc)).toList();
    return businesses;
  } else {
    return null;
  }
}
