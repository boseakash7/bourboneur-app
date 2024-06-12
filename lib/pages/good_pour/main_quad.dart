import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/good_pour/quad_box.dart';
import 'package:bourboneur/pages/good_pour/quad_text.dart';
import 'package:flutter/material.dart';
import 'dart:math'  as math;

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainQuad extends StatefulWidget {
  MainQuad({
    super.key,
    this.onTapSpicyEarthy,
    this.onTapEarthyFruity,
    this.onTapSweetFruity,
    this.onTapSweetSpicy,
    this.onTapCenter
  });

  void Function()? onTapSpicyEarthy;
  void Function()? onTapEarthyFruity;
  void Function()? onTapSweetFruity;
  void Function()? onTapSweetSpicy;
  void Function()? onTapCenter;

  @override
  State<MainQuad> createState() => _MainQuadState();
}

class _MainQuadState extends State<MainQuad> {
  @override
  Widget build(BuildContext context) {
    return Container(          
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(            
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 70,
              ),
              Text("Find a good pour,",
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Theme.of(context).textTheme.bodySmall?.color,                  
                  fontSize: 35,
                  height: 1
                ),
              ),
              const Text(                
                "let us suggest a bourbon",
                textAlign: TextAlign.center,
              ),              
              const SizedBox(
                height: 50,
              ),
              MainQuadBox(
                onTapCenter: widget.onTapCenter,
                onTapEarthyFruity: widget.onTapEarthyFruity,
                onTapSpicyEarthy: widget.onTapSpicyEarthy,
                onTapSweetFruity: widget.onTapSweetFruity,
                onTapSweetSpicy: widget.onTapSweetSpicy,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "tap a quadrant below to find custom suggestions that fit your taste!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: const Color(0xffe07e2f)
                ),
              ),
              
            ],
          ),
        );
  }
}


class MainQuadBox extends StatelessWidget {
  MainQuadBox({
    super.key,
    this.onTapSpicyEarthy,
    this.onTapEarthyFruity,
    this.onTapSweetFruity,
    this.onTapSweetSpicy,
    this.onTapCenter,
  });

  Color? mainQuadColor = const Color(0xFFff8202);
  Color? centerQuadColor = const Color(0xFF70370a);
  Color? topLeft = const Color(0xffff8203);
  Color? topRight = const Color(0xffda6d0e);
  Color? bottomLeft = const Color(0xffffff00);
  Color? bottomRight = const Color(0xffeab200);

  void Function()? onTapSpicyEarthy;
  void Function()? onTapEarthyFruity;
  void Function()? onTapSweetFruity;
  void Function()? onTapSweetSpicy;
  void Function()? onTapCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: -math.pi / 2,
            child: QuadText(text: "earthy", color: mainQuadColor),
          ),
          Column(
            children: [
              QuadText(text: "spicy", color: mainQuadColor),
              const SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          QuadBox(
                            color: topLeft,
                            onTap: onTapSpicyEarthy,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          QuadBox(
                            color: topRight,
                            onTap: onTapSweetSpicy,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          QuadBox(
                            color: bottomLeft,
                            onTap: onTapEarthyFruity,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          QuadBox(
                            color: bottomRight,
                            onTap: onTapSweetFruity,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      left: QuadBox.width / 2 + 5,
                      top: QuadBox.width / 2 + 5,
                      child: QuadBox(
                        color: centerQuadColor,
                        onTap: onTapCenter,
                      )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              QuadText(text: "fruity", color: mainQuadColor),
            ],
          ),
          Transform.rotate(
            angle: math.pi / 2,
            child: QuadText(text: "sweet", color: mainQuadColor),
          ),
        ],
      ),
    );
  }
}