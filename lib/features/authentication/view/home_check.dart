import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_states.dart';
import 'package:final_project/features/authentication/view/first_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCheck extends StatelessWidget {
final  Widget route;

const  HomeCheck({super.key, required this.route});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FutureBuilder<User?>(
            future: AuthCubit.get(context).checkUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Show loading indicator while checking
              } else if (snapshot.hasData && snapshot.data != null
              && AuthCubit.get(context).userFound) {
                return route; // User is logged in, navigate to Home
              } else {
                return const FirstScreen(); // User is not logged in, show Login
              }
            },
          );
        });
  }
}
