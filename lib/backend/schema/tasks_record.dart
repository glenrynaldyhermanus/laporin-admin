import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "due" field.
  DateTime? _due;
  DateTime? get due => _due;
  bool hasDue() => _due != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "form" field.
  DocumentReference? _form;
  DocumentReference? get form => _form;
  bool hasForm() => _form != null;

  // "done_at" field.
  DateTime? _doneAt;
  DateTime? get doneAt => _doneAt;
  bool hasDoneAt() => _doneAt != null;

  // "assignees" field.
  List<DocumentReference>? _assignees;
  List<DocumentReference> get assignees => _assignees ?? const [];
  bool hasAssignees() => _assignees != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _due = snapshotData['due'] as DateTime?;
    _location = snapshotData['location'] as String?;
    _status = snapshotData['status'] as String?;
    _form = snapshotData['form'] as DocumentReference?;
    _doneAt = snapshotData['done_at'] as DateTime?;
    _assignees = getDataList(snapshotData['assignees']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  DocumentReference? owner,
  String? name,
  String? description,
  DateTime? due,
  String? location,
  String? status,
  DocumentReference? form,
  DateTime? doneAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'name': name,
      'description': description,
      'due': due,
      'location': location,
      'status': status,
      'form': form,
      'done_at': doneAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.due == e2?.due &&
        e1?.location == e2?.location &&
        e1?.status == e2?.status &&
        e1?.form == e2?.form &&
        e1?.doneAt == e2?.doneAt &&
        listEquality.equals(e1?.assignees, e2?.assignees);
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.name,
        e?.description,
        e?.due,
        e?.location,
        e?.status,
        e?.form,
        e?.doneAt,
        e?.assignees
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
