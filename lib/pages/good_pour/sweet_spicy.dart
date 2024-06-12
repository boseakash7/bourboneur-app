
import 'package:bourboneur/pages/good_pour/good_pour_back.dart';
import 'package:bourboneur/pages/good_pour/quad_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';


class SweetSpicyQuad extends StatefulWidget {
  SweetSpicyQuad(
      {super.key,
      this.onTapSweetSpicy,
      this.onTapMoreSweet,    
      this.onTapMoreSpicy,
      this.onTapBack,
      this.onTapRefresh
      });

  void Function()? onTapSweetSpicy;
  void Function()? onTapMoreSweet;
  void Function()? onTapMoreSpicy;
  void Function()? onTapBack;
  void Function()? onTapRefresh;

  @override
  State<SweetSpicyQuad> createState() => _SweetSpicyQuadState();
}

class _SweetSpicyQuadState extends State<SweetSpicyQuad> {
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
            height: 70,
          ),
          Text.rich(
              textAlign: TextAlign.center,
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
          const Text(
            "Proprietary Analysis",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          
          SweetSpicyQuadBox(
            onTapMoreSpicy: widget.onTapMoreSpicy,
            onTapMoreSweet: widget.onTapMoreSweet,
            onTapSweetSpicy: widget.onTapSweetSpicy,
          ),
          const SizedBox(
                height: 50,
              ),
          Text(
            "Let's get specific.",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: const Color(0xffe07e2f)),
          )
        ],
      ),
    );
  }
}

class SweetSpicyQuadBox extends StatelessWidget {
  SweetSpicyQuadBox({
    super.key,
    this.onTapSweetSpicy,
    this.onTapMoreSweet,
    this.onTapMoreSpicy,
  });

  Color? mainQuadColor = const Color(0xFFff8202);
  Color? centerQuadColor = const Color(0xFF70370a);
  void Function()? onTapSweetSpicy;
  void Function()? onTapMoreSweet;
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
                right: -32,
                child: Transform.rotate(
                  angle: math.pi / 2,
                  child: Text("Sweet",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: mainQuadColor)),
                )),
            Positioned(
                top: -24,
                left: QuadBox.width / 2 - 10,
                child: Text("Spicy",
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  QuadBox(
                                    color: const Color(0xff70370a),
                                    onTap: onTapMoreSpicy,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  QuadBox(
                                    color: const Color(0xff070f1a),
                                    onTap: onTapSweetSpicy,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  QuadBox(
                                    color: const Color(0xffffe699),
                                    onTap: onTapMoreSweet,
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
