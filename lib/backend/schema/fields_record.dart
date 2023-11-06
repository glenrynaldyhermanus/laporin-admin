import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FieldsRecord extends FirestoreRecord {
  FieldsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sequence" field.
  double? _sequence;
  double get sequence => _sequence ?? 0.0;
  bool hasSequence() => _sequence != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _sequence = castToType<double>(snapshotData['sequence']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fields');

  static Stream<FieldsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FieldsRecord.fromSnapshot(s));

  static Future<FieldsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FieldsRecord.fromSnapshot(s));

  static FieldsRecord fromSnapshot(DocumentSnapshot snapshot) => FieldsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FieldsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FieldsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FieldsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FieldsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFieldsRecordData({
  String? name,
  double? sequence,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'sequence': sequence,
    }.withoutNulls,
  );

  return firestoreData;
}

class FieldsRecordDocumentEquality implements Equality<FieldsRecord> {
  const FieldsRecordDocumentEquality();

  @override
  bool equals(FieldsRecord? e1, FieldsRecord? e2) {
    return e1?.name == e2?.name && e1?.sequence == e2?.sequence;
  }

  @override
  int hash(FieldsRecord? e) =>
      const ListEquality().hash([e?.name, e?.sequence]);

  @override
  bool isValidKey(Object? o) => o is FieldsRecord;
}
