import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://unkuhwerknxxunvqpzlb.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVua3Vod2Vya254eHVudnFwemxiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk0NTkwOTQsImV4cCI6MjAxNTAzNTA5NH0.1Dr3eGbDHifoPTx8jpuxRpcRm5_N4zm9PO9d7Cn8CIM';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
