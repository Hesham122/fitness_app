import 'package:final_project/features/authentication/view/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_background.dart';
import 'login_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    requestPermissions(); // Request permission when the app starts
  }

  Future<void> requestPermissions() async {
    // Check if the permission is already granted
    if (await Permission.activityRecognition.isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
    } else {
      // Request the permission if it's not granted
      PermissionStatus status = await Permission.activityRecognition.request();
      if (status.isGranted) {
        setState(() {
          _isPermissionGranted = true;
        });
      } else {
        setState(() {
          _isPermissionGranted = false;
        });
        // You can also show a dialog explaining why permission is needed
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      _isPermissionGranted ?
      Stack(
              children: [
                const FitnessBackground(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomAuthButton(
                          text: "Get Started",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          }),
                      const SizedBox(height: 10),
                      const Text(
                        "or",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: const Text("Log in",
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                color: Colors.white)),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            )
          : Container(),
      // Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             'Permission not granted!',
      //             style: TextStyle(fontSize: 24, color: Colors.red),
      //           ),
      //           ElevatedButton(
      //             onPressed: requestPermissions,
      //             child: Text('Grant Permission'),
      //           ),
      //         ],
      //       ),
    );
  }
}
