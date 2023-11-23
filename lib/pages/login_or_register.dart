import 'package:flutter/material.dart';
import 'package:foottery/pages/login_page.dart';
import 'package:foottery/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => __LoginOrRegisterState();
}

class __LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLoginPage = true;

  togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}