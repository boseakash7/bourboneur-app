import 'dart:io';

import 'package:bourboneur/Core/Apis/Auth.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/pages/delete_account.dart';
import 'package:bourboneur/pages/blog.dart';
import 'package:bourboneur/pages/bluebook.dart';
import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/explore.dart';
import 'package:bourboneur/pages/good_pour.dart';
import 'package:bourboneur/pages/ios_subscription_page.dart';
import 'package:bourboneur/pages/portal.dart';
import 'package:bourboneur/pages/sign_in.dart';
import 'package:bourboneur/pages/wheel_of_destiny.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Core/Utils.dart';

class LoginWrapper extends StatefulWidget {
  LoginWrapper({super.key, required this.child});

  Widget child;

  @override
  State<LoginWrapper> createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/logo.png', width: 150),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Menu();
                  });
            },
            child: Container(
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.all(15.0),
              child: const Icon(Icons.menu, color: Color(0xFFf47c1a), size: 30),
            ),
          )
        ],
      ),
      body: widget.child,
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Controller controller = Get.find<Controller>();
  var utils = Utils();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).colorScheme.background),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Get.to(() => const DeleteAccount());
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.value.name!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xfff47c1a)),
                  ),
                  Text(
                    controller.user.value.email!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  Text("Delete Account",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          color: Color(0xfff47c1a)))
                ],
              ),
            ),
          ),
          MenuItem(
              text: 'Home',
              onTap: () {
                Get.offAll(() => DashboardPage());
              }),
          MenuItem(
            text: 'Bourbon Blue Book',
            onTap: () {
              Get.to(() => BlueBook());
            },
          ),
          MenuItem(
              text: 'Wheel of Destiny',
              onTap: () {
                Get.to(() => WheelOfDestiny());
              }),
          MenuItem(
              text: 'Explore your bourbon',
              onTap: () {
                Get.to(() => ExplorePage());
              }),
          MenuItem(
              text: 'Bourbon Suggestions',
              onTap: () {
                Get.to(() => GoodPourPage());
              }),
          MenuItem(
              text: 'Bourbon Blog',
              onTap: () {
                Get.to(() => Blog());
              }),
          if ( controller.user.value.isFree != "1" )
          MenuItem(
              text: 'Billing',
              onTap: () {
                if(controller.user.value.lastPaymentMethod == null){
                  Platform.isAndroid?
                  Get.to(() => PortalPage())
                  : launchUrl(Uri.parse(
                          "https://apps.apple.com/account/subscriptions"));
                }
                else if (Platform.isAndroid &&
                    controller.user.value.lastPaymentMethod == "apple_in_app") {
                 Get.to(() => IosSubscriptionPage());
                }
                 else if (
                    controller.user.value.lastPaymentMethod == "stripe") {
                  Get.to(() => PortalPage());
                }
                 else {
                  launchUrl(Uri.parse(
                      "https://apps.apple.com/account/subscriptions"));
                }
              }),
          MenuItem(
              text: 'Logout',
              onTap: () {
                Auth.logout();
                Get.offAll(() => SignInPage());
              }),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({super.key, required this.text, this.onTap});

  final String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (onTap != null) onTap!();
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Text(text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Color(0xfff47c1a),
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ),
    );
  }
}
