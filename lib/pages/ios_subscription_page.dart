import 'package:bourboneur/common/login_wrapper.dart';
import 'package:flutter/material.dart';

class IosSubscriptionPage extends StatelessWidget {
  const IosSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
        child: const Center(
      child: Text(
        "Looks like you have purchased the subscription on apple device. Please open App Store to manage your subscription.",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ));
  }
}
