import 'package:flutter/material.dart';
import 'package:mera_pariwar/components/interactive_elements/custom_button.dart';
import 'package:mera_pariwar/components/interactive_elements/text_input.dart';
import 'package:mera_pariwar/screens/home.dart';
import 'package:mera_pariwar/themes/themes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Image.asset(
                    'assets/logos/logo.png',
                    color: AppTheme.blueColor,
                    width: 150,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 32,
                      color: AppTheme.blueColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Login to continue',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                // Email input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: MyTextInput(
                    controller: TextEditingController(),
                    placeholder: 'Email',
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                    icon: Icons.email_outlined,
                    obscureText: false,
                  ),
                ),
                // Password input
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: MyTextInput(
                    controller: TextEditingController(),
                    placeholder: 'Password',
                    onChanged: (value) {
                      print('Password changed: $value');
                    },
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                ),
                // Login button
                MyButton(
                  text: 'Login',
                  onClick: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  fillColor: const Color.fromARGB(255, 1, 47, 85),
                  textColor: Colors.white,
                ),
                // Forgot Password button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: MyButton(
                    text: 'Forgot Password ?',
                    onClick: () {
                      print('Forgot Password Button clicked');
                    },
                    fillColor: AppTheme.whiteText,
                    textColor: AppTheme.blueColor,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ? ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Sign Up Text clicked');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppTheme.blueColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
