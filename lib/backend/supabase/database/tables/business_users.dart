import '../database.dart';

class BusinessUsersTable extends SupabaseTable<BusinessUsersRow> {
  @override
  String get tableName => 'business_users';

  @override
  BusinessUsersRow createRow(Map<String, dynamic> data) =>
      BusinessUsersRow(data);
}

class BusinessUsersRow extends SupabaseDataRow {
  BusinessUsersRow(super.data);

  @override
  SupabaseTable get table => BusinessUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get businessId => getField<int>('business_id')!;
  set businessId(int value) => setField<int>('business_id', value);

  int? get roleId => getField<int>('role_id');
  set roleId(int? value) => setField<int>('role_id', value);

  DateTime get lastOpenedAt => getField<DateTime>('last_opened_at')!;
  set lastOpenedAt(DateTime value) =>
      setField<DateTime>('last_opened_at', value);
}
