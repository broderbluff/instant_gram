import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instant_gram/state/auth/backend/authenticator.dart';
import 'package:instant_gram/state/auth/provider/auth_state_provider.dart';
import 'package:instant_gram/state/auth/provider/is_logged_in_provider.dart';
import 'package:instant_gram/views/components/loading/loading_screen.dart';

import 'firebase_options.dart';

//custom log function
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        indicatorColor: Colors.amber.shade900,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: Consumer(
        builder: ((context, ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);
          return isLoggedIn ? const MainView() : const LoginView();
        }),
      ),
    );
  }
}

//when you're already logged in.
class MainView extends StatelessWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Consumer(
        builder: (_, ref, child) {
          return TextButton(
            onPressed: () async {
                  LoadingScreen.instance().show(context: context, text: 'Loading');

             // ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text(
              'Logout',
            ),
          );
        },
      ),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logged in view',
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
            child: const Text('Google'),
          ),
        ],
      ),
    );
  }
}
