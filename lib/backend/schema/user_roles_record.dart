import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserRolesRecord extends FirestoreRecord {
  UserRolesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "roles" field.
  List<DocumentReference>? _roles;
  List<DocumentReference> get roles => _roles ?? const [];
  bool hasRoles() => _roles != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _roles = getDataList(snapshotData['roles']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_roles');

  static Stream<UserRolesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRolesRecord.fromSnapshot(s));

  static Future<UserRolesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRolesRecord.fromSnapshot(s));

  static UserRolesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRolesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRolesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRolesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRolesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRolesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRolesRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRolesRecordDocumentEquality implements Equality<UserRolesRecord> {
  const UserRolesRecordDocumentEquality();

  @override
  bool equals(UserRolesRecord? e1, UserRolesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user && listEquality.equals(e1?.roles, e2?.roles);
  }

  @override
  int hash(UserRolesRecord? e) =>
      const ListEquality().hash([e?.user, e?.roles]);

  @override
  bool isValidKey(Object? o) => o is UserRolesRecord;
}
