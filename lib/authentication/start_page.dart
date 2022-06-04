import 'package:awesome_to_do_app/authentication/auth_checker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const AuthChecker();
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
