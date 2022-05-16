import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/user/user_cubit.dart';
import 'package:notes_app/views/login_screen.dart';
import '../components/navigation_functions.dart';
import '../models/user.dart';
import 'components/app_logo.dart';
import 'components/custom_button.dart';
import 'components/custom_text_field.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppLogo()),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AddUserSuccessfulState) {
            navigateWithoutBack(context, LoginScreen());
          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Register",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700)),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextFormField(
                            controller: firstNameController,
                            keyboardType: TextInputType.name,
                            labelText: "First name",
                          )),
                          const SizedBox(width: 10),
                          Expanded(
                              child: CustomTextFormField(
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            labelText: "Last name",
                          )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: "E-mail",
                        hintText: "Enter your e-mail",
                        prefixIcon: Icons.email_outlined,
                        isEmail: true,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: "Password",
                        hintText: "Enter your password",
                        prefixIcon: Icons.lock_outlined,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      (state is AddUserLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomButton(
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  User user = User(
                                      email: emailController.text,
                                      firstname: firstNameController.text,
                                      lastname: lastNameController.text,
                                      password: passwordController.text);
                                  cubit.addUser(newUser: user.toJson());
                                }
                              },
                              text: "Register")
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}