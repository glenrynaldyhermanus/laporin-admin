import '../database.dart';

class FormsTable extends SupabaseTable<FormsRow> {
  @override
  String get tableName => 'forms';

  @override
  FormsRow createRow(Map<String, dynamic> data) => FormsRow(data);
}

class FormsRow extends SupabaseDataRow {
  FormsRow(super.data);

  @override
  SupabaseTable get table => FormsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  int get businessId => getField<int>('business_id')!;
  set businessId(int value) => setField<int>('business_id', value);

  int get ownerId => getField<int>('owner_id')!;
  set ownerId(int value) => setField<int>('owner_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}
