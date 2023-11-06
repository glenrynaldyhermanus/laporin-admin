import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "clocked_in" field.
  DateTime? _clockedIn;
  DateTime? get clockedIn => _clockedIn;
  bool hasClockedIn() => _clockedIn != null;

  // "clocked_out" field.
  DateTime? _clockedOut;
  DateTime? get clockedOut => _clockedOut;
  bool hasClockedOut() => _clockedOut != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _clockedIn = snapshotData['clocked_in'] as DateTime?;
    _clockedOut = snapshotData['clocked_out'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('attendance')
          : FirebaseFirestore.instance.collectionGroup('attendance');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('attendance').doc();

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  DateTime? clockedIn,
  DateTime? clockedOut,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clocked_in': clockedIn,
      'clocked_out': clockedOut,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    return e1?.clockedIn == e2?.clockedIn && e1?.clockedOut == e2?.clockedOut;
  }

  @override
  int hash(AttendanceRecord? e) =>
      const ListEquality().hash([e?.clockedIn, e?.clockedOut]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
