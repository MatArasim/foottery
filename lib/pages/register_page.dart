import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foottery/components/big_button.dart';
import 'package:foottery/components/text_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();



  void signUp() async {
    try {
     if(passwordController.text == passwordConfirmController.text){
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
     }else{
      showErrorMessage("Passwords dont match");
     }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showErrorMessage('Bad data');
      } else if (e.code == 'wrong-password') {
        showErrorMessage('Bad data');
      }
    }
  }
  showErrorMessage(String text)
  {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 40),
              const Icon(
                Icons.food_bank,
                size: 100,
                color: Colors.lightGreen,
              ),
              const Text(
                'Foottery',
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              TextInput(
                controller: emailController,
                hintText: 'E-mail',
                obscureText: false,
              ),
              const SizedBox(height: 15),
              TextInput(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
               const SizedBox(height: 15),
                 TextInput(
                controller: passwordConfirmController,
                hintText: 'Confirm password',
                obscureText: true,
              ),
              const SizedBox(height: 60),
              BigButton(
                onTap: signUp,
                buttonText: 'Sign up',
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do you have account?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login!',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
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
