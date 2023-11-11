import '../database.dart';

class FieldOptionsTable extends SupabaseTable<FieldOptionsRow> {
  @override
  String get tableName => 'field_options';

  @override
  FieldOptionsRow createRow(Map<String, dynamic> data) => FieldOptionsRow(data);
}

class FieldOptionsRow extends SupabaseDataRow {
  FieldOptionsRow(super.data);

  @override
  SupabaseTable get table => FieldOptionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get fieldId => getField<int>('field_id')!;
  set fieldId(int value) => setField<int>('field_id', value);

  String get option => getField<String>('option')!;
  set option(String value) => setField<String>('option', value);
}
