import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

bool canGoBack(String pageTitle) {
  // if pageTitle contains character '>' return true or else return false
  return pageTitle.contains(' / ');
}

String getFieldFromReference(
  DocumentReference fieldRef,
  List<FieldsRecord> fieldList,
) {
  // get field name from fieldList by matching document id
  String fieldName = '';
  for (FieldsRecord field in fieldList) {
    if (field.reference == fieldRef) {
      fieldName = field.name;
      break;
    }
  }
  return fieldName;
}

DocumentReference getReferenceFromFieldName(
  String fieldName,
  List<FieldsRecord> fields,
) {
  // get reference or document id from fieldName search on fields
  for (final field in fields) {
    if (field.hasName() && field.name == fieldName) {
      return field.reference;
    }
  }
  throw Exception('No field with name $fieldName found.');
}

int getFormFieldCount(DocumentReference form) {
  // get form_fields count from form
  int count = 0;
  form.collection('form_fields').get().then((querySnapshot) {
    count = querySnapshot.size;
  });
  return count;
}

bool isHavingBusiness(List<BusinessRecord>? businessList) {
  // return true if businessList is not null and not empty else return false
  if (businessList != null && businessList.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

DocumentReference getReferenceFromFormName(
  String formName,
  List<FormsRecord> forms,
) {
  // get reference or document id from fieldName search on fields
  for (final form in forms) {
    if (form.hasName() && form.name == formName) {
      return form.reference;
    }
  }
  throw Exception('No field with name $formName found.');
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

DocumentReference getReferenceFromUserName(
  String userName,
  List<UsersRecord> users,
) {
  for (final user in users) {
    if (user.hasDisplayName() && user.displayName == userName) {
      return user.reference;
    }
  }
  throw Exception('No field with name $userName found.');
}

DateTime startingDate(DateTime timestamp) {
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 0, 0, 0);
}

DateTime endingDate(DateTime timestamp) {
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 23, 59, 59);
}
