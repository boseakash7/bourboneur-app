import 'package:bourboneur/Core/Utils.dart';
import 'package:bourboneur/pages/search_blog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogSearchInput extends StatefulWidget {
  BlogSearchInput({
    super.key,    
    this.onTapSearch,
    this.controller
  });

  String? keyword;
  void Function()? onTapSearch;
  TextEditingController? controller;

  @override
  State<BlogSearchInput> createState() => _BlogSearchInputState();
}

class _BlogSearchInputState extends State<BlogSearchInput> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFff8202), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFff8202), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        isDense: true,
        filled: false,
        suffixIcon: GestureDetector(
            child: TextButton(
                onPressed: widget.onTapSearch,
                child: Text(
                  "Search",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ))),
      ),
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
