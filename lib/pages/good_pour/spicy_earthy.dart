import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/good_pour/good_pour_back.dart';
import 'package:bourboneur/pages/good_pour/quad_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SpicyEarthyQuad extends StatefulWidget {
  SpicyEarthyQuad(
      {super.key,
      this.onTapSpicyEarthy,
      this.onTapMoreEarthy,
      this.onTapMoreSpicy,
      this.onTapBack,
      this.onTapRefresh});

  void Function()? onTapSpicyEarthy;
  void Function()? onTapMoreEarthy;
  void Function()? onTapMoreSpicy;
  void Function()? onTapBack;
  void Function()? onTapRefresh;

  @override
  State<SpicyEarthyQuad> createState() => _SpicyEarthyQuadState();
}

class _SpicyEarthyQuadState extends State<SpicyEarthyQuad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),      
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GoodPourBack(
            onTapBack: widget.onTapBack,
            onTapRefresh: widget.onTapRefresh,
          ),
          const SizedBox(
            height: 30,
          ),
          Text.rich(
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'BebasNeue',
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  fontSize: 40,
                  height: 1),
              TextSpan(text: "Bourboneur", children: [
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(0.0, -30.0),
                    child: Text(
                      '®',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'TradeGothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                    ),
                  ),
                )
              ])),
          Text(
            "Proprietary Analysis",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(                            
                            fontSize: 17,
                            fontFamily: 'Arial'),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            "Let's get specific.",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(                            
                            fontSize: 17,
                            fontFamily: 'Arial'),
          ),
          const SizedBox(
                height: 50,
              ),
         
          SpicyEarthyQuadBox(
            onTapMoreEarthy: widget.onTapMoreEarthy,
            onTapMoreSpicy: widget.onTapMoreSpicy,
            onTapSpicyEarthy: widget.onTapSpicyEarthy,
          ),
          
        ],
      ),
    );
  }
}

class SpicyEarthyQuadBox extends StatelessWidget {
  SpicyEarthyQuadBox({
    super.key,
    this.onTapSpicyEarthy,
    this.onTapMoreEarthy,
    this.onTapMoreSpicy,
  });

  Color? mainQuadColor = const Color(0xFFff8202);
  Color? centerQuadColor = const Color(0xFF70370a);
  void Function()? onTapSpicyEarthy;
  void Function()? onTapMoreEarthy;
  void Function()? onTapMoreSpicy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                bottom: QuadBox.height / 2 + 10,
                left: -30,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: Text("earty",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: mainQuadColor)),
                )),
            Positioned(
                top: -24,
                right: QuadBox.width / 2 - 10,
                child: Text("spicy",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: mainQuadColor))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                      color: Color(0xffda6d0e),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  QuadBox(
                                    color: const Color(0xff70370a),
                                    onTap: onTapSpicyEarthy,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  QuadBox(
                                    color: const Color(0xff070f1a),
                                    onTap: onTapMoreSpicy,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  QuadBox(
                                    color: const Color(0xffffe699),
                                    onTap: onTapMoreEarthy,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
