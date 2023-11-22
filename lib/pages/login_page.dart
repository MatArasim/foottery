// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foottery/components/big_button.dart';
import 'package:foottery/components/text_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'wrong-email') {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(title: Text('Wrong email or password'));
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 40),
              Icon(
                Icons.food_bank,
                size: 100,
                color: Colors.lightGreen,
              ),
              Text(
                'Foottery',
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100),
              TextInput(
                controller: emailController,
                hintText: 'E-mail',
                obscureText: false,
              ),
              SizedBox(height: 15),
              TextInput(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 60),
              BigButton(
                onTap: signIn,
                buttonText: 'Sign in',
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?'),
                  SizedBox(width: 5),
                  Text(
                    'Register now!',
                    style: TextStyle(
                        color: Colors.lightGreen, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
