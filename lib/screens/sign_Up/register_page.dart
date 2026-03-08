import 'package:ecommerce/functions/createUser.dart';
import 'package:ecommerce/functions/showMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_textF.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  // ignore: unused_field
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool inAsyncCall = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Image.asset('assets/images/food_hub.png'),
                    const SizedBox(height: 100),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomTextF(
                            obscureText: false,
                            text: 'Email',
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomTextF(
                            obscureText: true,
                            text: 'Password',
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      text: 'Register',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            inAsyncCall = true;
                          });

                          try {
                            await createUser(email, password);
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-email') {
                              ShowMessage(context, 'Invalid email');
                            } else if (e.code == 'user-not-found') {
                              ShowMessage(context, 'User not found');
                            } else if (e.code == 'email-already-in-use') {
                              ShowMessage(context, 'Email already in use');
                            } else if (e.code == 'wrong-password') {
                              ShowMessage(context, 'Wrong password');
                            } else {
                              ShowMessage(context, e.toString());
                            }
                          }
                          setState(() {
                            inAsyncCall = false;
                          });
                        } else {
                          ShowMessage(context, 'Please fill all the fields');
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
