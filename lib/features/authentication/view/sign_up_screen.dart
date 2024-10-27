import 'package:final_project/core/custom_wedgits/custom_bottomnavigationbar.dart';
import 'package:final_project/core/utils/colors.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_states.dart';
import 'package:final_project/features/authentication/widgets/custom_auth_button.dart';
import 'package:final_project/features/authentication/widgets/custom_auth_title.dart';
import 'package:final_project/features/authentication/widgets/custom_background.dart';
import 'package:final_project/features/authentication/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const FloatingNavBar(),
              ));
        }
      },
      builder: (context, state) => 
      state is AuthLoading?const Center(
        heightFactor: 20,
        child: CircularProgressIndicator(
          
        ),
      ):
      state is AuthSuccess?
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const FitnessBackground(),
            Center(
              child: Column(
                children: [
                  const CustomAuthTitle(title: "Sign up"),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                                keyboardType: TextInputType.text,
                                controller: nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Full Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@') ||
                                      !value.contains('.')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password is too short';
                                }
                                return null;
                              },
                              obscure: true,
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: confirmPassController,
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password is too short';
                                }
                                if (value != passController.text) {
                                  return 'The password do not match';
                                }
                                return null;
                              },
                              obscure: true,
                            ),
                            const SizedBox(height: 30),
                            CustomAuthButton(
                              text: "Sign up",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  AuthCubit.get(context)
                                      .signUpWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text,
                                    name: nameController.text,
                                  );
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colorsapp.darkOrange),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
  :    Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const FitnessBackground(),
            Center(
              child: Column(
                children: [
                  const CustomAuthTitle(title: "Sign up"),
                  Container(
                    width: MediaQuery.of(context).size.width * .8,
                    height: MediaQuery.of(context).size.height * .7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                                keyboardType: TextInputType.text,
                                controller: nameController,
                                decoration: const InputDecoration(
                                    labelText: 'Full Name'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!value.contains('@') ||
                                      !value.contains('.')) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                }),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: passController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password is too short';
                                }
                                return null;
                              },
                              obscure: true,
                            ),
                            const SizedBox(height: 30),
                            CustomTextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              controller: confirmPassController,
                              decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password is too short';
                                }
                                if (value != passController.text) {
                                  return 'The password do not match';
                                }
                                return null;
                              },
                              obscure: true,
                            ),
                            const SizedBox(height: 30),
                            CustomAuthButton(
                              text: "Sign up",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  AuthCubit.get(context)
                                      .signUpWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text,
                                    name: nameController.text,
                                  );
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account? "),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colorsapp.darkOrange),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
  
    );
  }
}
