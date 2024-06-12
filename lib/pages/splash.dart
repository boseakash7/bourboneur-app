import 'dart:async';

import 'package:bourboneur/Core/Apis/Config.dart';
import 'package:bourboneur/Core/Apis/User.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/pages/page_helpers/open_dashboard.dart';
import 'package:bourboneur/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Controller controller = Get.find<Controller>();
  VideoPlayerController? _controller;
  Utils utils = Utils();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/splash.mp4')
      ..initialize().then((_) {
        _controller!.play();
        _controller!.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});

        Timer(const Duration(seconds: 5), () { 
          _prepareToLaunch();
        });
    });
  }

  _prepareToLaunch() async {
    await _getConfig();
    await _tryToLogin(); 
  }

  Future<void> _tryToLogin() async {
    String? id = await utils.getLocal('user_id');
    if ( id == null ) {
      Get.off(() => SignInPage());   
      return;
    }

    bool response = await UserApi.getById(id);
    if ( !response ) {
      utils.removeLocal('user_id');
      Get.off(() => SignInPage());
      return;
    }

    Get.off(() => openDashboard(controller.user.value));

  }

  Future<void> _getConfig() async {
    bool response = await ConfigApi.all();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller!.value.size.width,
                height: _controller!.value.size.height,
                child: VideoPlayer(_controller!),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/splash-logo.png", width: 300),
                Text(
                  "Helping to make the world\nwhiskey wise",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 18,
                    color: Colors.white
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
