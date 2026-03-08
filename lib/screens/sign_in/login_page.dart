import 'package:ecommerce/routes/app_routoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:ecommerce/functions/loginUser.dart';
import 'package:ecommerce/functions/showMessage.dart';
import 'package:ecommerce/screens/sign_up/register_page.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/custom_textF.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  // ignore: unused_field
  static String id = 'LoginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool inAsyncCall = false;

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Image.asset('assets/images/food_hub.png'),
                // const Text(
                //   'Food Hub',
                //   style: TextStyle(
                //     fontSize: 32,
                //     color: Colors.white,
                //     fontFamily: 'Pacifico',
                //   ),
                // ),
                const SizedBox(height: 100),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16),
                  child: const Text(
                    'Login Page',
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
                  text: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        inAsyncCall = true;
                      });
                      try {
                        await loginUser(email, password);
                        // ignore: use_build_context_synchronously
                        ShowMessage(context, 'Login Successful! Welcome back.');
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, AppRoutes.home);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found' ||
                            e.code == 'wrong-password' ||
                            e.code == 'invalid-credential') {
                          ShowMessage(context, 'Invalid email or password.');
                        } else if (e.code == 'network-request-failed') {
                          ShowMessage(
                            context,
                            'Check your internet connection.',
                          );
                        } else {
                          ShowMessage(
                            context,
                            e.message ?? 'Login failed. Please try again.',
                          );
                        }
                      } catch (e) {
                        ShowMessage(context, 'An unexpected error occurred.');
                      } finally {
                        setState(() {
                          inAsyncCall = false;
                        });
                      }
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.sgin_up);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.orange),
                      ),
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
