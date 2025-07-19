import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:login/presentation/screens/login_screen.dart';
import 'package:movie_clean_architecture_modules/di/injection.dart';
import 'package:navigator/navigation_module.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.prod);
  runApp(const NavigationModule());
}
