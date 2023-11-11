import '../database.dart';

class UserAttendancesTable extends SupabaseTable<UserAttendancesRow> {
  @override
  String get tableName => 'user_attendances';

  @override
  UserAttendancesRow createRow(Map<String, dynamic> data) =>
      UserAttendancesRow(data);
}

class UserAttendancesRow extends SupabaseDataRow {
  UserAttendancesRow(super.data);

  @override
  SupabaseTable get table => UserAttendancesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  DateTime? get clockedInAt => getField<DateTime>('clocked_in_at');
  set clockedInAt(DateTime? value) =>
      setField<DateTime>('clocked_in_at', value);

  DateTime? get clockedOutAt => getField<DateTime>('clocked_out_at');
  set clockedOutAt(DateTime? value) =>
      setField<DateTime>('clocked_out_at', value);
}
