import 'package:flutter/material.dart';
import 'package:notes_app/app_theme/app_colors.dart';
import 'package:notes_app/components/navigation_functions.dart';
import 'package:notes_app/components/toast_message.dart';
import 'package:notes_app/views/components/custom_button.dart';
import 'package:notes_app/views/components/custom_text_field.dart';
import 'package:notes_app/views/home_screen.dart';
import 'package:notes_app/views/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/notes.png"),
                    radius: 50,
                  ),
                  const SizedBox(height: 20),
                  Text("Log in",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700)),
                  const SizedBox(height: 20),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                              controller: usernameController,
                              keyboardType: TextInputType.name,
                              labelText: "Username",
                              hintText: "Enter your username",
                              prefixIcon: Icons.person_outline),
                          const SizedBox(height: 20),
                          CustomTextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              labelText: "Password",
                              hintText: "Enter your Password",
                              prefixIcon: Icons.lock_outline,
                              isPassword: true),
                          const SizedBox(height: 20),
                          CustomButton(
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  print(usernameController.text);
                                  print(passwordController.text);
                                  navigateWithoutBack(context, HomeScreen());
                                }
                              },
                              text: "Login")
                        ],
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      child: Text("Register Now",
                          style: TextStyle(color: AppColors.bluePrimaryColor)),
                      onPressed: () {
                        navigateWithBack(context, RegisterScreen());
                      },
                    )
                  ]),
                ],
              ),
            ),
          ),
        ));
    ;
  }
}