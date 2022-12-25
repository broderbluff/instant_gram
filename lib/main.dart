import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instant_gram/state/auth/backend/authenticator.dart';

import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomePage(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.amber.shade900,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              final result = await Authenticator().loginWithGoogle();
              result.log();
            },
            child: const Text('Google'),
          ),
        ],
      ),
    );
  }
}
