import 'package:final_project/core/caching/caching_helper.dart';
import 'package:final_project/core/custom_wedgits/custom_bottomnavigationbar.dart';
import 'package:final_project/core/utils/share_snackbar.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_states.dart';
import 'package:final_project/features/authentication/view/first_screen.dart';
import 'package:final_project/features/authentication/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
      builder: (context, state) {
         
        return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (snapshot.hasError) {
            return snackbarshare(context, "Something went wrong");
          } else if (snapshot.hasData) {
            // if (mounted) return;
            return const FloatingNavBar(); // home() OR verify email
          } else {
            bool start = CachingHelper.instance?.readString("firstTime") == "";
               return start?const FirstScreen():
              LoginScreen();
          }
        });
      },
    );
  }
}
