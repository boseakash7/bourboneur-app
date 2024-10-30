import 'package:bourboneur/common/custom_button.dart';
import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/bottles_list.dart';
import 'package:bourboneur/pages/chart_page/chart.dart';
import 'package:bourboneur/pages/chart_page/chart_widget.dart';
import 'package:bourboneur/pages/chart_page/choose_bottle_wiskey.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ChartWidget(),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => BottlesList());
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffe17f2f), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    padding: const EdgeInsets.all(15),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xffe17f2f),
                              size: 26,
                            ),
                            Text("8.27% YTD",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe17f2f),
                                    // letterSpacing: 2.5,
                                    fontSize: 18,
                                    height: 1.2))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("BOURBONEUR SECONDARY MARKET INDEX",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffe17f2f),
                                    // letterSpacing: 2.5,
                                    fontSize: 13,
                                    height: 1.2))
                      ],
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ChooseBottleWhiskey());
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffe17f2f), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    padding: const EdgeInsets.all(15),
                    child: const Column(
                      children: [
                        Text("BOTTLES",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 4,
                                fontSize: 35,
                                height: 1.2)),
                        Text("CLICK TO UPDATE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontWeight: FontWeight.bold,
                                color: Color(0xffe17f2f),
                                // letterSpacing: 2.5,
                                fontSize: 13,
                                height: 1.2)),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
