import '../database.dart';

class FieldTypesTable extends SupabaseTable<FieldTypesRow> {
  @override
  String get tableName => 'field_types';

  @override
  FieldTypesRow createRow(Map<String, dynamic> data) => FieldTypesRow(data);
}

class FieldTypesRow extends SupabaseDataRow {
  FieldTypesRow(super.data);

  @override
  SupabaseTable get table => FieldTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get hasOption => getField<bool>('has_option')!;
  set hasOption(bool value) => setField<bool>('has_option', value);
}
