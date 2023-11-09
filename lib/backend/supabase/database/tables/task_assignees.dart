import '../database.dart';

class TaskAssigneesTable extends SupabaseTable<TaskAssigneesRow> {
  @override
  String get tableName => 'task_assignees';

  @override
  TaskAssigneesRow createRow(Map<String, dynamic> data) =>
      TaskAssigneesRow(data);
}

class TaskAssigneesRow extends SupabaseDataRow {
  TaskAssigneesRow(super.data);

  @override
  SupabaseTable get table => TaskAssigneesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get taskId => getField<int>('task_id')!;
  set taskId(int value) => setField<int>('task_id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);
}
