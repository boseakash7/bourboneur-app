import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WheelTextField extends StatefulWidget {
  WheelTextField({
    super.key,
    this.onChanged,
    this.controller
  });

  void Function(String)? onChanged;
  TextEditingController? controller;

  @override
  State<WheelTextField> createState() => _WheelTextFieldState();
}

class _WheelTextFieldState extends State<WheelTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      maxLines: 10,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontSize: 12, fontFamily: 'Arial'),
      onChanged: widget.onChanged,
      decoration: const InputDecoration(
          isDense: true,
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: BorderSide(
                  color: Color(0xffe07e2f),
                  width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
              borderSide: BorderSide(
                  color: Color(0xffe07e2f),
                  width: 1))),
    );
  }
}
