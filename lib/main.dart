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
      home:  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final appSettingsProvider = getIt<AppSettingsProvider>();
  final sessionProvider = getIt<SessionProvider>();


  void _incrementCounter() {
    doLogin();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('app language ${appSettingsProvider.getAppLanguage()}'),
             Text('sessionProvidere ${sessionProvider.getClientId()}'),
            Text('app theme ${appSettingsProvider.getThemeType()}'),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
