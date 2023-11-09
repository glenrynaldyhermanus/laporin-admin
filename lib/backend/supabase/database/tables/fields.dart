import '../database.dart';

class FieldsTable extends SupabaseTable<FieldsRow> {
  @override
  String get tableName => 'fields';

  @override
  FieldsRow createRow(Map<String, dynamic> data) => FieldsRow(data);
}

class FieldsRow extends SupabaseDataRow {
  FieldsRow(super.data);

  @override
  SupabaseTable get table => FieldsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get fieldTypeId => getField<int>('field_type_id');
  set fieldTypeId(int? value) => setField<int>('field_type_id', value);

  int? get pageId => getField<int>('page_id');
  set pageId(int? value) => setField<int>('page_id', value);

  String get question => getField<String>('question')!;
  set question(String value) => setField<String>('question', value);

  int get formId => getField<int>('form_id')!;
  set formId(int value) => setField<int>('form_id', value);
}
