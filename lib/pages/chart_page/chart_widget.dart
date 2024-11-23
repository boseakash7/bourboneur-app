import 'package:bourboneur/pages/chart_page/chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  ChartWidget(
      {super.key,
      required this.data,
      required this.isLoading,
      required this.overall,
      required this.valuation,
      required this.ytd});

  List data;
  bool isLoading;
  String valuation;
  String overall;
  String ytd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe17f2f), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text.rich(
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: const Color(0xffe17f2f),
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
              TextSpan(text: "MY COLLECTION VALUE\n", children: [
                TextSpan(
                    text: "\$$valuation\n",
                    style: const TextStyle(
                        fontFamily: 'Arial', fontSize: 35, height: 1.2)),
                TextSpan(text: "$ytd% YTD\n"),
                TextSpan(text: "$overall% OVERALL"),
              ])),
          Container(
            height: 210,
            padding: const EdgeInsets.only(left: 0, right: 0, top: 20),
            child: data.isNotEmpty && !isLoading
                ? Chart(
                    data: data,
                  )
                : Center(
                    child: Text(isLoading ? "Syncing..." : "No data"),
                  ),
          )
        ],
      ),
    );
  }
}
