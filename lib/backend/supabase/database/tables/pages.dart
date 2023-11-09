import '../database.dart';

class PagesTable extends SupabaseTable<PagesRow> {
  @override
  String get tableName => 'pages';

  @override
  PagesRow createRow(Map<String, dynamic> data) => PagesRow(data);
}

class PagesRow extends SupabaseDataRow {
  PagesRow(super.data);

  @override
  SupabaseTable get table => PagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get formId => getField<int>('form_id');
  set formId(int? value) => setField<int>('form_id', value);
}
