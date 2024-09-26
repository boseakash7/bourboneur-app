import 'package:bourboneur/common/login_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class IosSubscriptionPage extends StatelessWidget {
  const IosSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
        child:  Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Looks like you have purchased the subscription on apple device. Please open App Store to manage your subscription.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 5,),
            InkWell(
              onTap: () {
                   launchUrl(Uri.parse(
                      "https://apps.apple.com/account/subscriptions"));
              },
              child: const Text(
                "Go to Apple app store",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xfff47c1a), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
