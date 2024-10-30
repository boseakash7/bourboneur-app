import 'package:flutter/material.dart';

class BottleListSort extends StatefulWidget {

  BottleListSort({
    super.key,
    required this.labels,
    this.defaultSelected = 0
  });

  List<String> labels;
  int defaultSelected;

  @override
  State<BottleListSort> createState() => _BottleListSortState();
}

class _BottleListSortState extends State<BottleListSort> {
  
  int? selectedValue;

  @override
  void initState() {
    selectedValue = widget.defaultSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffe17f2f),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _prepareItems(),
      ),
    );
  }

  List<BottleListSortItem> _prepareItems() {
    List<BottleListSortItem> items = [];
    items = widget.labels.map((String value) {
      return BottleListSortItem(
        text: value,
        value: value,
        isSelected: widget.labels.indexOf(value) == selectedValue,
        onTap: (String value) {
          setState(() {
            selectedValue = widget.labels.indexOf(value);
          });
        },
      );
    }).toList();

    return items;
  }
}

class BottleListSortItem extends StatefulWidget {
  BottleListSortItem(
      {super.key,
      required this.text,
      required this.value,
      this.onTap,
      this.isSelected = false});

  String text;
  String value;
  void Function(String)? onTap;
  bool isSelected;

  @override
  State<BottleListSortItem> createState() => _BottleListSortItemState();
}

class _BottleListSortItemState extends State<BottleListSortItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) widget.onTap!(widget.value);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: widget.isSelected ? Color.fromARGB(255, 189, 107, 39) : null,
        child: Text(
          widget.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.isSelected ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
