import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:final_project/features/Steps/cubit/steps_cubit.dart';
import 'package:final_project/features/authentication/cubit/auth_cubit.dart';
import 'package:final_project/features/workout/cubit/workout_cubit.dart';
import 'package:final_project/features/body_calc/cubit/body_calc_cubit.dart';
import 'package:final_project/features/nutrition/cubit/nutrition_cubit.dart';
import 'package:final_project/features/sleep/cubit/sleep_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/caching/caching_helper.dart';
import 'core/notification/notification_service.dart';
import 'core/utils/colors.dart';
import 'features/profile/cubit/profile_cubit.dart';
import 'features/splash/views/splash_view.dart';
import 'features/water/cubit/water_cubit.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestActivityRecognitionPermission() async {
  var status = await Permission.activityRecognition.status;
  if (status.isDenied) {
    // We need to request permission
    await Permission.activityRecognition.request();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final NotificationService notificationService = NotificationService();
  notificationService.init();
  await CachingHelper.init();
  await AndroidAlarmManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit()..getUserData(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit(),
          ),
          BlocProvider(
            create: (context) => WorkoutCubit(),
          ),
          BlocProvider(
            create: (context) => NutritionCubit(),
          ),
          BlocProvider(
            create: (context) => BodyCalcCubit(),
          ),
          BlocProvider(
            create: (context) => SleepCubit(),
          ),
          BlocProvider(
            create: (context) => StepsCubit(),
          ),
          BlocProvider(
            create: (context) => WaterCubit(),
          ),
        ],
        child:
         MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colorsapp.darkOrange),
            useMaterial3: true,
          ),
          home: const SplashView(),
        ));
  }
}
