import 'package:firebase_auth/firebase_auth.dart';

Future<void> loginUser(String? email, String? password) async {
  var auth = FirebaseAuth.instance;
  await auth.signInWithEmailAndPassword(email: email!, password: password!);
}
