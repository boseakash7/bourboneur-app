import 'package:bourboneur/Core/Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OpenPopup extends StatefulWidget {
  OpenPopup({
    super.key,
    this.onTapDelete,
    this.onTapOpen
  });

  void Function(String)? onTapOpen;
  void Function(String)? onTapDelete;

  @override
  State<OpenPopup> createState() => _OpenPopupState();
}

class _OpenPopupState extends State<OpenPopup> {
  Controller controller = Get.find<Controller>();

  List<Item> _prepareItems() {
    return controller.wods.map((element) {
      return Item(
        id: element.id!,
        text: element.name!, 
        onTapOpen: widget.onTapOpen, 
        onTapDelete: widget.onTapDelete
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 20,
          top: 20,
          child: GestureDetector(
            onTap: () {Navigator.of(context).pop(); },
            child: const Icon(
              Icons.close,
              size: 40,
              color: Color(0xffe07e2f),
            ),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(color: const Color(0xffe07e2f))),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 40,
                maxHeight: 400),
            child: SingleChildScrollView(
              child: Column(
                children: _prepareItems(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Item extends StatelessWidget {
  Item({
    super.key, 
    required this.text,
    required this.id,
    this.onTapOpen, 
    this.onTapDelete
  });

  final String id;
  final String text;
  void Function(String)? onTapOpen;
  void Function(String)? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(text,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    overflow: TextOverflow.ellipsis, color: Colors.white)),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap:  () {
                  if ( onTapOpen != null ) onTapOpen!(id);
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.folder,
                  size: 20,
                  color: Color(0xffe07e2f),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  if ( onTapDelete != null ) onTapDelete!(id);
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.delete,
                  size: 20,
                  color: Color(0xffe07e2f),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
