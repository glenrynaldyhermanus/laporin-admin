import '../database.dart';

class ResponseFieldsTable extends SupabaseTable<ResponseFieldsRow> {
  @override
  String get tableName => 'response_fields';

  @override
  ResponseFieldsRow createRow(Map<String, dynamic> data) =>
      ResponseFieldsRow(data);
}

class ResponseFieldsRow extends SupabaseDataRow {
  ResponseFieldsRow(super.data);

  @override
  SupabaseTable get table => ResponseFieldsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get fieldId => getField<int>('field_id')!;
  set fieldId(int value) => setField<int>('field_id', value);

  int get responseId => getField<int>('response_id')!;
  set responseId(int value) => setField<int>('response_id', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);
}
