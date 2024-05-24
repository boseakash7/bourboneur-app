
import 'package:bourboneur/pages/Explore/ExploreController.dart';
import 'package:flutter/material.dart';

class ExploreItem extends StatefulWidget {
  ExploreItem(
      {super.key,
      required this.text,
      this.childPadding,
      this.children, 
      this.expand,
      this.onTapOpen,
      this.controller});

  String text;
  List<Widget>? children;
  EdgeInsetsGeometry? childPadding;
  bool? expand;
  void Function()? onTapOpen;
  ExploreItemController? controller;

  @override
  State<ExploreItem> createState() => _ExploreItemState();
}

class _ExploreItemState extends State<ExploreItem> {
  bool showChild = false;

  @override
  void initState() {
    widget.controller?.close = _close;
    super.initState();
  }

  void _close()
  {
    print("Explore: Close called");
    setState(() {
      showChild = false;
    });
  }

  @override
  void dispose() {
    widget.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {    
            if ( widget.onTapOpen != null && showChild == false ) widget.onTapOpen!();            
            setState(() {              
              showChild = !showChild;
            });            
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffe07e2f), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: showChild == true && widget.children != null ? Color.fromARGB(255, 130, 2, 21) : null
              ),
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  color: const Color(0xffe07e2f),
                  fontWeight: FontWeight.bold,
                  height: 1),
            ),
          ),
        ),
        if (showChild && widget.children != null )
          Container(
            padding: widget.childPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: widget.children!,
            ),
          )
      ],
    );
  }
}

