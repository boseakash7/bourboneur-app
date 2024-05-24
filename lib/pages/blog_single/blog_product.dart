import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlogProduct extends StatelessWidget {
  BlogProduct({super.key, required this.text, this.onTap});

  String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff252525), width: 2)),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 22,
                  color: Colors.white),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 7, bottom: 10),
              decoration: BoxDecoration(
                  color: Color(0xffe07e2f),
                  borderRadius: const BorderRadius.all(Radius.circular(1))),
              child: Text(
                "Buy Now",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(    
                      fontSize: 18,                  
                      color: Theme.of(context).colorScheme.background
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
