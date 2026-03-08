import 'package:firebase_auth/firebase_auth.dart';

Future<void> createUser(String? email, String? password) async {
  var auth = FirebaseAuth.instance;
  await auth.createUserWithEmailAndPassword(email: email!, password: password!);
}
