import 'package:bourboneur/pages/dashboard.dart';
import 'package:bourboneur/pages/good_pour/good_pour_back.dart';
import 'package:bourboneur/pages/good_pour/quad_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SweetFruitQuad extends StatefulWidget {
  SweetFruitQuad(
      {super.key,
      this.onTapMoreSweet,
      this.onTapMoreFruit,
      this.onTapMoreSweetFruit,
      this.onTapBack,
      this.onTapRefresh});

  void Function()? onTapMoreSweet;
  void Function()? onTapMoreFruit;
  void Function()? onTapMoreSweetFruit;
  void Function()? onTapBack;
  void Function()? onTapRefresh;

  @override
  State<SweetFruitQuad> createState() => _SweetFruitQuadState();
}

class _SweetFruitQuadState extends State<SweetFruitQuad> {
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
            height: 20,
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
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 17, fontFamily: 'Arial'),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Let's get specific.",
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 17, fontFamily: 'Arial'),
          ),
          const SizedBox(
            height: 50,
          ),
          SweetFruitQuadBox(
            onTapMoreSweet: widget.onTapMoreSweet,
            onTapMoreFruit: widget.onTapMoreFruit,
            onTapMoreSweetFruit: widget.onTapMoreSweetFruit,
          ),
        ],
      ),
    );
  }
}

class SweetFruitQuadBox extends StatelessWidget {
  SweetFruitQuadBox({
    super.key,
    this.onTapMoreSweet,
    this.onTapMoreFruit,
    this.onTapMoreSweetFruit,
  });

  Color? mainQuadColor = const Color(0xFFff8202);
  Color? centerQuadColor = const Color(0xFF70370a);
  void Function()? onTapMoreSweet;
  void Function()? onTapMoreFruit;
  void Function()? onTapMoreSweetFruit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: QuadBox.height / 2 + 10,
                right: -32,
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Text("Sweet",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: mainQuadColor)),
                )),
            Positioned(
                bottom: -24,
                left: QuadBox.width / 2 - 10,
                child: Text("Fruity",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: mainQuadColor))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                      color: Color(0xffeab100),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  QuadBox(
                                    color: const Color(0xff70370a),
                                    onTap: onTapMoreSweet,
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
                                    onTap: onTapMoreFruit,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  QuadBox(
                                    color: const Color(0xff070f1a),
                                    onTap: onTapMoreSweetFruit,
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
