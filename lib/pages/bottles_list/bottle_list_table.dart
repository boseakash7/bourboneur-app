import 'dart:math' as math;
import 'package:flutter/material.dart';

class BottleListTable extends StatefulWidget {
  BottleListTable({super.key, this.editMode = true});

  bool editMode;

  @override
  State<BottleListTable> createState() => _BottleListTableState();
}

class _BottleListTableState extends State<BottleListTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffe17f2f), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
            BottleListTableItem(editMode: widget.editMode),
          ],
        ));
  }
}

class BottleListTableItem extends StatelessWidget {
  BottleListTableItem({super.key, required this.editMode});

  bool editMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            "Some Bottles #" + math.Random().nextInt(20).toString(),
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          )),
          if ( editMode )
          Icon(
            Icons.delete_forever, 
            color: Color(0xffe17f2f),
            size: 25,
          )
        ],
      ),
    );
  }
}
