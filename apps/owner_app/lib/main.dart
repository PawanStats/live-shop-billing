import 'package:flutter/material.dart';
import 'app.dart';
import 'core/supabase_client.dart';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty) {
    await SupabaseService.init(url: supabaseUrl, anonKey: supabaseAnonKey);
  }
  runApp(const OwnerApp());
}
