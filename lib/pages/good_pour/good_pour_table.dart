import 'package:bourboneur/Core/Apis/GoodPour.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Controllers/GoodPour.dart';
import 'package:bourboneur/pages/good_pour/good_pour_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:get/get.dart';




class GoodPourTable extends StatefulWidget {
  GoodPourTable(
      {super.key,
      required this.tableType,
      this.onTapBack,
      this.onTapRefresh
      });

  int? tableType;
  void Function()? onTapBack;
  void Function()? onTapRefresh;

  @override
  State<GoodPourTable> createState() => _GoodPourTableState();
}

class _GoodPourTableState extends State<GoodPourTable> {
  Controller controller = Get.find<Controller>();
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var response = await GoodPourApi.all(widget.tableType.toString(), "1", "100000");
    if ( !response ) 
    {
      return;
    }
    setState(() {
      
    });
  }

  String getTableSubTextText()
  {
    String text = "";

    print(widget.tableType);

    switch (widget.tableType) {
      case 0:
        text = "shooting down the middle... try one of these:";
        break;
      case 1:
      case 12:
        text = "ribbons of sweetness... here ya go:";
        break;
      case 2:
        text = "sweet and spicy, wow... try one:";
        break;
      case 3:
      case 4:
        text = "so you like it spicy I see... these fit that bill:";
        break;
      case 5:
        text = "spicy and earthy, try these:";
        break;
      case 6:
      case 7:
        text = "the drier the better, eh? ...try these similar bourbons:";
        break;
      case 8:
        text = "earthy and fruity... try these:";
        break;
      case 9:
      case 10:
        text = "fruity and fresh...these are your bourbons:";
        break;
      case 11:
        text = "fruity, sweet, wonderful... try these:";
      default:
        text = "";
    }

    return text;
  }

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
            "PROPRIETARY ANALYSIS",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            getTableSubTextText(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: const Color(0xffe07e2f))
          ),
          const SizedBox(
            height: 20,
          ),        
          MainTable(
            items: controller.goodpour.value
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}

class MainTable extends StatelessWidget {
  MainTable({super.key, this.items = const []});

  List<GoodPour> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text("Proof", style: Theme.of(context).textTheme.titleMedium?.copyWith( fontSize: 15, color: const Color(0xFFeabf00) )),
            ),            
            Text("Bottle", style: Theme.of(context).textTheme.titleMedium?.copyWith( fontSize: 15, color: const Color(0xFFeabf00) ))
          ],
        ),
        
      ]..addAll(_prepareTable(context)),
    );
  }

  List<Row> _prepareTable(BuildContext context) {
    List <Row> list = [];

    for ( GoodPour item in items )
    {
      list.add(Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(item.proof!, style: Theme.of(context).textTheme.titleMedium?.copyWith( fontSize: 14, color: const Color(0xFFeabf00) )),
            ),            
            Text(item.bottleName!, style: Theme.of(context).textTheme.titleMedium?.copyWith( fontSize: 14, color: const Color(0xFFeabf00) ))
          ],
        ));
    }

    return list;
  }
}