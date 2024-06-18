import 'package:flutter/material.dart';

class PersonalUse extends StatelessWidget {
  const PersonalUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20,
          top: 20,
          child: GestureDetector(
            onTap: () { Navigator.of(context).pop(); },
            child: const Icon(
              Icons.close,
              size: 40,
              color: Color(0xffe07e2f),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(color: const Color(0xffe07e2f))),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 40,
                maxHeight: 800),
            child: SingleChildScrollView(
              child: Text(
                "*Personal Use Only.  Your use of the Service provided herein is at your sole risk.   All material and information obtained through the use of the Service is accessed at your own discretion and risk.   No advice or information, whether oral or written, obtained by you from Bourboneur.com shall create any warranty whatsoever.  You may make personal use of all of the information you access on Bourboneur.com (“Information”), but you may not take any of the Information and re-format and display it, or copy it on your Web site or in any other format, and you may not store or migrate any of the Information or other data from Bourboneur.com without Bourboneur’s written permission.  As a condition of your use of and access to Bourboneur.com, you agree not to use the Services for any unlawful purpose or in any way that violates the above terms and conditions.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
    );;
  }
}