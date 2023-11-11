import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool canGoBack(String pageTitle) {
  // if pageTitle contains character '>' return true or else return false
  return pageTitle.contains(' / ');
}

List<FieldsRow>? getReferenceFromFieldName(
  String fieldName,
  List<FieldTypesRow> fields,
) {
  // // get reference or document id from fieldName search on fields
  // for (final field in fields) {
  //   if (field.hasName() && field.name == fieldName) {
  //     return field.reference;
  //   }
  // }
  // throw Exception('No field with name $fieldName found.');

  return null;
}

String getNameAbbrevation(String name) {
  // get the first letter of business for each letter maximum 2 letter
  List<String> words = name.split(' ');
  String abbreviation = '';
  for (String word in words) {
    if (word.isNotEmpty) {
      abbreviation += word[0].toUpperCase();
      if (abbreviation.length == 2) {
        break;
      }
    }
  }
  return abbreviation;
}

UsersRow? getReferenceFromUserName(String userName) {
  // for (final user in users) {
  //   if (user.hasDisplayName() && user.displayName == userName) {
  //     return user.reference;
  //   }
  // }
  // throw Exception('No field with name $userName found.');

  return null;
}

DateTime startingDate(DateTime timestamp) {
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 0, 0, 0);
}

DateTime endingDate(DateTime timestamp) {
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 23, 59, 59);
}

bool isEven(int index) {
  // is index even return false, if odd return true
  if (index % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

FieldTypesRow? getFieldTypeFromList(
  int typeId,
  List<FieldTypesRow> fieldTypes,
) {
  // get field type by matching id from fieldTypes.id
  for (final fieldType in fieldTypes) {
    if (fieldType.id == typeId) {
      return fieldType;
    }
  }
  return null; // or throw an exception if desired
}
