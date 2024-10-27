// ignore_for_file: unused_element, use_build_context_synchronously

import 'package:final_project/features/authentication/widgets/streambuilderwidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
   
    throw UnimplementedError();
  }

 
}

class _SplashViewState extends State<SplashView> {
  // video controller
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/GymLogo.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setVolume(0.0);

    _playVideo();
  }

  void _playVideo() async {
    // playing video
    _controller.play();

    //add delay till video is complite
    await Future.delayed(const Duration(seconds: 4));

    // navigating to home screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (
      BuildContext context)=> const StreamBuilderWidget()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(
                  _controller,
                ),
              )
            : Container(),
      ),
    );
  }
}