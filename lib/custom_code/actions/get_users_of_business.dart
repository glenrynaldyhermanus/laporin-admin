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

Future<List<UsersRow>> getUsersOfBusiness(int businessId) async {
  final datas = await SupaFlow.client
      .from('users')
      .select('id, name, business_users(id, role_id)');

  List<UsersRow> users = [];
  for (var data in datas) {
    users.add(UsersRow(data));
  }

  return users;
}
