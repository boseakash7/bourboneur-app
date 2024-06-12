import 'package:flutter/material.dart';

class WiningPopup extends StatelessWidget {
  const WiningPopup({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20,
          top: 20,
          child: GestureDetector(
            onTap: () {Navigator.of(context).pop(); },
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
                maxHeight: 400),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "and you're drinking,",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xffe07e2f),
                      fontSize: 22
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Pour it and Score it!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xffbfbfbf)
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}