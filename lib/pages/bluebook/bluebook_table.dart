import 'package:bourboneur/Core/Apis/Bluebook.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:bourboneur/Core/Controllers/BlueBooks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueBookTable extends StatefulWidget {
  BlueBookTable({super.key, this.keyword});

  String? keyword;

  @override
  State<BlueBookTable> createState() => _BlueBookTableState();
}

class _BlueBookTableState extends State<BlueBookTable> {
  Controller controller = Get.find<Controller>();
  bool isLoading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    bool response = await BlueBookApi.all("1", "12000");
    if (!response) {
      return;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
          inside: BorderSide.none, outside: BorderSide.none),
      columnWidths: const {
        0: FixedColumnWidth(170),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          decoration: BoxDecoration(color:  Theme.of(context).textTheme.titleMedium!.color),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
              child: Text(
                "Bottle",
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                "Average",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                "Low",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
              child: Text(
                "High",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.background),
              ),
            )
          ],
        ),
      ]..addAll(_prepareTableRows(controller.bluebooks)),
    );
  }

  List<TableRow> _prepareTableRows(RxList<BlueBook> result) {
    List<TableRow> list = [];
    if ( isLoading ) {
      list.add(TableRow(
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 73, 73, 73), width: 1))),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
              child: Text(
                "Loading...",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                "",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
              child: Text(
                "",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            )
          ]));
          return list;
    }
    
    for (BlueBook bluebook in result.value) {

      if ( widget.keyword != null && widget.keyword != "" )
      {
        var bottleName = bluebook.bottleName!;
        if ( !bottleName.toUpperCase().contains(widget.keyword!.toUpperCase()) ) continue;
      }

      list.add(TableRow(
          decoration: const BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 73, 73, 73), width: 1))),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, bottom: 12, right: 12),
              child: Text(
                bluebook.bottleName!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                bluebook.average!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: Text(
                bluebook.low!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
              child: Text(
                bluebook.high!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            )
          ]));
    }

    return list;
  }
}
