import 'package:awesome_to_do_app/authentication/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServicesProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          ElevatedButton(
            onPressed: () => auth.signOut(),
            child: const Text('Sign-out'),
          ),
        ],
      ),
    );
  }
}
