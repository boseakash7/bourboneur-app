import 'dart:math' as math;
import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/bottles_list/bottle_list_sort.dart';
import 'package:bourboneur/pages/bottles_list/bottle_list_table.dart';
import 'package:bourboneur/pages/bottles_list/search_input.dart';
import 'package:bourboneur/pages/bottles_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BottlesList extends StatefulWidget {
  BottlesList({super.key, this.isWishlist = false});

  bool isWishlist;

  @override
  State<BottlesList> createState() => _BottlesListState();
}

class _BottlesListState extends State<BottlesList> {
  bool isWishlist = false;

  List<String> sortLabels = ["NEWEST", "NAME A-Z", "NAME Z-A", "OLDEST"];
  bool isEditing = false;

  @override
  void initState() {
    isWishlist = widget.isWishlist;

    super.initState();
  }

  void _handleOnTapEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isWishlist)
              const SizedBox(
                height: 70,
                child: Text("WISHLIST",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35)),
              ),
            BottlesSearchInput(
              readOnly: true,
              onTap: () {
                Get.to(() => BottlesSearchPage(
                  isWishList: isWishlist
                ));
              },
            ),
            const SizedBox(height: 20),
            ButtonListCounter(
              onTapEdit: _handleOnTapEdit,
              isEditing: isEditing,
            ),
            const SizedBox(height: 20),
            BottleListSort(
              labels: sortLabels,
              defaultSelected: 0,
            ),
            const SizedBox(height: 20),
            BottleListTable(
              editMode: isEditing,
            ),
            const SizedBox(height: 20),
            GestureDetector(
                onTap: () {
                  if ( isWishlist ) {
                    launchUrl(Uri.parse('https://brbnfndr.com'));
                    return;
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffe17f2f), width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7))),
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      isWishlist == false
                          ? "EXPORT TO WHEEL OF DESTINY"
                          : "BRBNFNDR.COM",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: isWishlist == false ? 20 : 30,
                        letterSpacing: isWishlist == false ? null : 2.9,
                        height: 1.2
                      )
                    )
                  )
              )
          ],
        ),
      ),
    ));
  }
}

class ButtonListCounter extends StatelessWidget {
  ButtonListCounter({
    super.key,
    this.onTapEdit,
    this.isEditing
  });

  void Function()? onTapEdit;
  bool? isEditing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffe17f2f), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(7))),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
                style: TextStyle(
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 35,
                    height: 1.2),
                text: "123 ",
                children: [
                  TextSpan(
                      text: "Bottles",
                      style: TextStyle(color: Color(0xffe17f2f)))
                ]),
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTapEdit,
            child: Icon(
              isEditing == true ? Icons.done : Icons.edit,
              color: const Color(0xffe17f2f)
            ),
          )
        ],
      ),
    );
  }
}
