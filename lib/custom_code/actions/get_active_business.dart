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

Future<BusinessUsersRow?> getActiveBusiness(int userId) async {
  // BusinessUsersTable query where user_id eq userId and get latest last_opened_at

  final result = await BusinessUsersTable().queryRows(
    queryFn: (q) => q
        .eq(
          'user_id',
          userId,
        )
        .order('last_opened_at', ascending: false),
  );

  if (result.isNotEmpty) {
    return result.first;
  }
  return null;
}
