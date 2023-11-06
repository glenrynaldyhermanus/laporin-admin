import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FormsRecord extends FirestoreRecord {
  FormsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "business" field.
  DocumentReference? _business;
  DocumentReference? get business => _business;
  bool hasBusiness() => _business != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _business = snapshotData['business'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('forms');

  static Stream<FormsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormsRecord.fromSnapshot(s));

  static Future<FormsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormsRecord.fromSnapshot(s));

  static FormsRecord fromSnapshot(DocumentSnapshot snapshot) => FormsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormsRecordData({
  String? name,
  DocumentReference? business,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'business': business,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormsRecordDocumentEquality implements Equality<FormsRecord> {
  const FormsRecordDocumentEquality();

  @override
  bool equals(FormsRecord? e1, FormsRecord? e2) {
    return e1?.name == e2?.name && e1?.business == e2?.business;
  }

  @override
  int hash(FormsRecord? e) => const ListEquality().hash([e?.name, e?.business]);

  @override
  bool isValidKey(Object? o) => o is FormsRecord;
}
