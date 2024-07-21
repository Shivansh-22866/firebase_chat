import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/auth/auth_service.dart';
import 'package:firebase_chat/components/custom_button.dart';
import 'package:firebase_chat/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  void register(BuildContext context) {
    AuthService _auth = AuthService();
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signupWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (error) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(error.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Please check and re-confirm your password"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.primary),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Enter your details for the new account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            CustomTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            CustomTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Login",
              onTap: () => register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Login now!",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
