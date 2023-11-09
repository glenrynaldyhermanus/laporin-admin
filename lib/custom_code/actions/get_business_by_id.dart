// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<BusinessesRow?> getBusinessById(int businessId) async {
  // Add your function code here!
  final result = await BusinessesTable().queryRows(
    queryFn: (q) => q.eq(
      'id',
      businessId,
    ),
  );

  if (result.isNotEmpty) {
    return result[0];
  }
  return null;
}
