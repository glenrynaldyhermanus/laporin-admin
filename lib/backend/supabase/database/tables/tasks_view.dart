import '../database.dart';

class TasksViewTable extends SupabaseTable<TasksViewRow> {
  @override
  String get tableName => 'tasks_view';

  @override
  TasksViewRow createRow(Map<String, dynamic> data) => TasksViewRow(data);
}

class TasksViewRow extends SupabaseDataRow {
  TasksViewRow(super.data);

  @override
  SupabaseTable get table => TasksViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  DateTime? get dueAt => getField<DateTime>('due_at');
  set dueAt(DateTime? value) => setField<DateTime>('due_at', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);
}
