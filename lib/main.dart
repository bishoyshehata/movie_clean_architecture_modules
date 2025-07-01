import 'package:app_settings/provider/app_settings_provider.dart';
import 'package:datastore/provider/sessions/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:login/login.dart';
import 'package:login/presentation/screens/login_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:  LoginScreen(),
    );
  }
}

