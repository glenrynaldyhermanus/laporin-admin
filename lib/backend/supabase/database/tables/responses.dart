import '../database.dart';

class ResponsesTable extends SupabaseTable<ResponsesRow> {
  @override
  String get tableName => 'responses';

  @override
  ResponsesRow createRow(Map<String, dynamic> data) => ResponsesRow(data);
}

class ResponsesRow extends SupabaseDataRow {
  ResponsesRow(super.data);

  @override
  SupabaseTable get table => ResponsesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get taskId => getField<int>('task_id')!;
  set taskId(int value) => setField<int>('task_id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  DateTime get startAt => getField<DateTime>('start_at')!;
  set startAt(DateTime value) => setField<DateTime>('start_at', value);

  DateTime get resumeAt => getField<DateTime>('resume_at')!;
  set resumeAt(DateTime value) => setField<DateTime>('resume_at', value);

  DateTime get finishAt => getField<DateTime>('finish_at')!;
  set finishAt(DateTime value) => setField<DateTime>('finish_at', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);
}
