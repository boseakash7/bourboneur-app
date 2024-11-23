import 'dart:math' as math;
import 'package:bourboneur/Core/Controllers/BlueBooks.dart';
import 'package:bourboneur/Core/Controllers/Collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottleListTable extends StatefulWidget {
  BottleListTable({
    super.key,
    this.collections,
    this.sortMode,
    this.editMode = true,
    // this.isWishList = false,
    this.onPressRemove
  });

  String? sortMode;
  RxList<Collection>? collections;
  bool editMode;
  void Function(Collection collection)? onPressRemove;
  // bool isWishList;

  @override
  State<BottleListTable> createState() => _BottleListTableState();
}

class _BottleListTableState extends State<BottleListTable> {



  List<BottleListTableItem> _prepareCollections() {

    List<BottleListTableItem> list = [];
    if (widget.collections != null) {
      RxList<Collection> sortedList =
          RxList<Collection>.from(widget.collections!);

      switch (widget.sortMode) {
        case 'NEWEST':
          sortedList.sort((item1, item2) {
            return item2.createdAt!
                .toString()
                .compareTo(item1.createdAt!.toString());
          });
          break;
        case 'NAME A-Z':
          sortedList.sort((item1, item2) {
            return item1.blueBook!.bottleName!
                .toLowerCase()
                .compareTo(item2.blueBook!.bottleName!.toLowerCase());
          });
          break;
        case 'NAME Z-A':
          sortedList.sort((item1, item2) {
            return item2.blueBook!.bottleName!
                .toLowerCase()
                .compareTo(item1.blueBook!.bottleName!.toLowerCase());
          });
          break;
        case 'OLDEST':
          sortedList.sort((item1, item2) {
            return item1.createdAt!
                .toString()
                .compareTo(item2.createdAt!.toString());
          });
          break;
      }

      list.addAll(sortedList.map((element) {
        return BottleListTableItem(
            collection: element,
            editMode: widget.editMode,
            onPressRemove: widget.onPressRemove
        );
      }).toList());
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 200),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffe17f2f), width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(7))),
        padding: const EdgeInsets.all(15),
        child: widget.collections != null && widget.collections!.isNotEmpty ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _prepareCollections(),
        ): const Text(
          "SEARCH ABOVE TO ADD YOUR BOTTLES",
          style: TextStyle(
            color: Color(0xffe17f2f),
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),
        ));
  }
}

class BottleListTableItem extends StatelessWidget {
  BottleListTableItem(
      {super.key,
      required this.collection,
      required this.editMode,
      this.onPressRemove});

  Collection collection;
  bool editMode;
  void Function(Collection)? onPressRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Text(
            collection.blueBook!.bottleName!,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
          )),
          if (editMode)
            GestureDetector(
              onTap: () {
                if (onPressRemove != null) onPressRemove!(collection);
              },
              child: const Icon(
                Icons.delete_forever,
                color: Color(0xffe17f2f),
                size: 25,
              ),
            )
        ],
      ),
    );
  }
}
