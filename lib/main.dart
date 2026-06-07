import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zenith_care/core/constants/app_sizes.dart';
import 'package:zenith_care/core/constants/app_theme.dart';

const _supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const _supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: _supabaseUrl,
    publishableKey: _supabaseAnonKey,
  );

  runApp(
    const ProviderScope(
      child: ZenithCareApp(),
    ),
  );
}

class ZenithCareApp extends StatelessWidget {
  const ZenithCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenithCare',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                'ZenithCare',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: AppSizes.spaceLG),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
