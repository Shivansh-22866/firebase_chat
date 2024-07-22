import 'package:firebase_chat/services/auth/auth_service.dart';
import 'package:firebase_chat/components/custom_button.dart';
import 'package:firebase_chat/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (error) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(error.toString()),
              ));
    }
  }

  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

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
              "Welcome back User!, nice to see you again!",
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
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a User?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register now!",
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
