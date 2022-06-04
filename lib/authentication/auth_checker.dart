import 'package:awesome_to_do_app/authentication/auth_providers.dart';
import 'package:awesome_to_do_app/authentication/login_page.dart';
import 'package:awesome_to_do_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (value) {
        if (value != null) {
          return const HomePage();
        }
        return const LoginPage();
      },
      error: (_, __) {
        return const Scaffold(
          body: Center(
            child: Text("There was a Login Error"),
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
