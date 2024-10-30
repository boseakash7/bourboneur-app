

import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/bottles_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseBottleWhiskey extends StatefulWidget {
  const ChooseBottleWhiskey({super.key});

  @override
  State<ChooseBottleWhiskey> createState() => _ChooseBottleWhiskeyState();
}

class _ChooseBottleWhiskeyState extends State<ChooseBottleWhiskey> {
  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset(
                  "assets/images/whiskey.png",
                  height: 150,
                ),
                SizedBox(height: 20),
                Text("How does\nit feel to be",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Arial',
                        color: Theme.of(context).textTheme.titleMedium?.color,
                        fontSize: 35,
                        height: 1.2)),
                const SizedBox(height: 10),
                const Text("WHISKEY WISE?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        color: Color(0xffe17f2f),
                        fontSize: 35,
                        height: 1.2)),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => BottlesList());
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffe17f2f), width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            padding: const EdgeInsets.all(15),
                            child: const Text("Bottles",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 35,
                                    height: 1.2))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => BottlesList(
                                isWishlist: true,
                              ));
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xffe17f2f), width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            padding: const EdgeInsets.all(15),
                            child: const Text("Wishlist",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 35,
                                    height: 1.2))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
