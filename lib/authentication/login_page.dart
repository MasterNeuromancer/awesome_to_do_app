import 'package:awesome_to_do_app/authentication/auth_providers.dart';
import 'package:awesome_to_do_app/authentication/login_page_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final passWord = ref.watch(passwordProvider);
    final auth = ref.watch(authServicesProvider);

    return Scaffold(
      body: Column(
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          TextField(
            onChanged: (value) =>
                ref.read(emailProvider.notifier).update((state) => value),
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            onChanged: (value) =>
                ref.read(passwordProvider.notifier).update((state) => value),
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () => auth.signIn(email: email, password: passWord),
            child: const Text('Sign-In'),
          ),
        ],
      ),
    );
  }
}
