import 'package:awesome_to_do_app/authentication/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((Ref ref) {
  return FirebaseAuth.instance;
});

final authServicesProvider = Provider<AuthenticationService>((Ref ref) {
  return AuthenticationService(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((Ref ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
