import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Wheel extends StatelessWidget {
  Wheel({
    super.key, 
    this.controller, 
    this.texts, 
    this.onTapSpin,
    this.onSpinEnd
  });

  final List<Color> colors = [
    const Color(0xffcf8d6a),
    const Color(0xffc16d3e),
    const Color(0xfffff9e1),
    const Color(0xffb9c5c1),
    const Color(0xff949e93),
    const Color(0xffd3c8c2),
    const Color(0xffb0a295)
  ];

  void Function()? onTapSpin;
  void Function()? onSpinEnd;

  StreamController<int>? controller;
  List? texts;

  List<Map<String, dynamic>>? items = [];

  double wheelFontSize = 18;

  int selectedColor = 0;

  addTextToWheel(String text) {
    if (selectedColor < colors.length - 1) {
      selectedColor++;
    } else {
      selectedColor = 0;
    }
    items!.add({"text": text, "color": selectedColor});

    if (text.characters.length >= 23 && wheelFontSize > 16) wheelFontSize = 16;
    if (text.characters.length >= 23 && wheelFontSize > 13) wheelFontSize = 13;

    if (items!.length >= 5 && wheelFontSize > 16) wheelFontSize = 16;
    if (items!.length >= 12 && wheelFontSize > 13) wheelFontSize = 13;
    if (items!.length >= 19 && wheelFontSize > 10) wheelFontSize = 10;
  }

  @override
  Widget build(BuildContext context) {
    if (texts != null) {
      texts = List.from(texts!);
      if (texts!.length == 1) {
        texts?.add("");
      }
      texts?.forEach((element) {
        addTextToWheel(element);
      });
    }

    var wItems = items!.map((e) {
      return FortuneItem(
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            // color: Colors.black,
            constraints: const BoxConstraints.expand(),
            alignment: Alignment.centerRight,
            child: Text(
              e['text'],
              style: TextStyle(
                  fontSize: wheelFontSize,
                  color: Theme.of(context).colorScheme.background),
              textAlign: TextAlign.end,
            ),
          ),
          style: FortuneItemStyle(
            color: colors[e['color']],
            // textStyle: TextStyle(fontSize: wheelFontSize),
          ));
    }).toList();

    return Container(
      padding: const EdgeInsets.only(left: 55, right: 55, top: 30, bottom: 30),
      decoration: const BoxDecoration(
        image:  DecorationImage(
                  image: AssetImage("assets/images/wheel_background.png"),
                  repeat: ImageRepeat.noRepeat,
                  alignment: Alignment.center,
                  fit: BoxFit.cover)
      ),
      child: Stack(
        children: [
          Container(
            height: 300,
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: FortuneWheel(
              onAnimationEnd: onSpinEnd,
              physics: NoPanPhysics(

              ),
              selected: controller!.stream,
              animateFirst: false,
              curve: Curves.easeInOut,
              rotationCount: 7,
              styleStrategy: UniformStyleStrategy(
                  textStyle: Theme.of(context).textTheme.bodySmall),
              indicators: [
                FortuneIndicator(
                  alignment: Alignment.center,
                  child: Transform.scale(
                      scale: 1.1,
                      child: Image.asset(
                        "assets/images/pointer.png",
                      )),
                ),
                // FortuneIndicator(
                //   child:
                // )
              ],
              items: wItems,
            ),
          ),
          Positioned.fill(          
            child:  Center(
              child: GestureDetector(
                onTap: onTapSpin,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(color: Colors.white, width: 2)
                  ),
                  child: Center(
                    child: Text("Spin", style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
