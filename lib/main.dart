import 'package:app_settings/provider/app_settings_provider.dart';
import 'package:datastore/provider/sessions/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:login/login.dart';
import 'package:movie_clean_architecture_modules/di/injection.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
    );
  }
}

