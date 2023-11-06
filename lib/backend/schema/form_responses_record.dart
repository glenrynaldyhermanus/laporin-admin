import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FormResponsesRecord extends FirestoreRecord {
  FormResponsesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "form_field" field.
  DocumentReference? _formField;
  DocumentReference? get formField => _formField;
  bool hasFormField() => _formField != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  bool hasAnswer() => _answer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _formField = snapshotData['form_field'] as DocumentReference?;
    _question = snapshotData['question'] as String?;
    _answer = snapshotData['answer'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('form_responses')
          : FirebaseFirestore.instance.collectionGroup('form_responses');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('form_responses').doc();

  static Stream<FormResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormResponsesRecord.fromSnapshot(s));

  static Future<FormResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormResponsesRecord.fromSnapshot(s));

  static FormResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormResponsesRecordData({
  DocumentReference? formField,
  String? question,
  String? answer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'form_field': formField,
      'question': question,
      'answer': answer,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormResponsesRecordDocumentEquality
    implements Equality<FormResponsesRecord> {
  const FormResponsesRecordDocumentEquality();

  @override
  bool equals(FormResponsesRecord? e1, FormResponsesRecord? e2) {
    return e1?.formField == e2?.formField &&
        e1?.question == e2?.question &&
        e1?.answer == e2?.answer;
  }

  @override
  int hash(FormResponsesRecord? e) =>
      const ListEquality().hash([e?.formField, e?.question, e?.answer]);

  @override
  bool isValidKey(Object? o) => o is FormResponsesRecord;
}
