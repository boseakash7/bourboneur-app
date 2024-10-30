import 'package:flutter/material.dart';

class BottlesSearchInput extends StatelessWidget {
  BottlesSearchInput({
    super.key,
    this.readOnly,
    this.autoFocus,
    this.onTap
  });

  bool? readOnly;
  bool? autoFocus;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      // onChanged: _onSearchChanged,
      onTap: onTap,
      readOnly: readOnly != null && readOnly == true,
      autofocus: autoFocus != null && autoFocus == true,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: FontWeight.bold),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search, color: Color(0xffe17f2f)),
        contentPadding: EdgeInsets.only(top: 7, bottom: 7, left: 7, right: 7),
        hintText: "Search",
        hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 2.5,
            fontWeight: FontWeight.normal),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe17f2f), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe17f2f), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe17f2f), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        isDense: true,
        filled: false,
      ),
    );
  }
}
