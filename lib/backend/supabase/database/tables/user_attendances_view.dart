import '../database.dart';

class UserAttendancesViewTable extends SupabaseTable<UserAttendancesViewRow> {
  @override
  String get tableName => 'user_attendances_view';

  @override
  UserAttendancesViewRow createRow(Map<String, dynamic> data) =>
      UserAttendancesViewRow(data);
}

class UserAttendancesViewRow extends SupabaseDataRow {
  UserAttendancesViewRow(super.data);

  @override
  SupabaseTable get table => UserAttendancesViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  DateTime? get clockedInAt => getField<DateTime>('clocked_in_at');
  set clockedInAt(DateTime? value) =>
      setField<DateTime>('clocked_in_at', value);

  DateTime? get clockedOutAt => getField<DateTime>('clocked_out_at');
  set clockedOutAt(DateTime? value) =>
      setField<DateTime>('clocked_out_at', value);

  String? get picturedIn => getField<String>('pictured_in');
  set picturedIn(String? value) => setField<String>('pictured_in', value);

  String? get picturedOut => getField<String>('pictured_out');
  set picturedOut(String? value) => setField<String>('pictured_out', value);

  double? get geoLatitudeIn => getField<double>('geo_latitude_in');
  set geoLatitudeIn(double? value) =>
      setField<double>('geo_latitude_in', value);

  double? get geoLongitudeIn => getField<double>('geo_longitude_in');
  set geoLongitudeIn(double? value) =>
      setField<double>('geo_longitude_in', value);

  double? get geoLatitudeOut => getField<double>('geo_latitude_out');
  set geoLatitudeOut(double? value) =>
      setField<double>('geo_latitude_out', value);

  double? get geoLongitudeOut => getField<double>('geo_longitude_out');
  set geoLongitudeOut(double? value) =>
      setField<double>('geo_longitude_out', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
