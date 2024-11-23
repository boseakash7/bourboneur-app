import 'package:bourboneur/Core/Apis/Firebase.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Controllers/User.dart';
import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/select_package.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  Future<void> setupFirebaseToken() async {
    Controller controller = Get.find<Controller>();
    // Get the token each time the application loads
    String? token = await FirebaseMessaging.instance.getToken();

    print(token);

    // Save the initial token to the database
    if ( token != null )
    {
      String? userId = controller.user.value.id;
      await FirebaseApi.storeFCM(userId, token);
    }    
    // await saveTokenToDatabase(token!);

    // Any time the token refreshes, store this in the database too.
    // FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);    
  }