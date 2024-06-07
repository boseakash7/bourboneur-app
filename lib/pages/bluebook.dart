import 'dart:async';

import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/bluebook/bluebook_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueBook extends StatefulWidget {
  const BlueBook({super.key});

  @override
  State<BlueBook> createState() => _BlueBookState();
}

class _BlueBookState extends State<BlueBook> {
  Timer? _debounce;
  String? keyword;

  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    
    super.initState();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
        setState(() {
          keyword = query;
        });
    });
  }

@override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: const BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                  image: AssetImage("assets/images/bbb-banner2.png"),
                  repeat: ImageRepeat.noRepeat,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [              
              Text("Bourbon Blue Book",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      color: Theme.of(context).textTheme.bodySmall?.color,
                      fontSize: 40,
                      height: 1)),
              Text(
                  "Real, Accurate Values.\nSearch prices of thousands of bottles.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Arial',
                      color: Theme.of(context).textTheme.titleMedium!.color,
                      fontSize: 12,
                      height: 1.2)),
              const SizedBox(
                height: 150,
              ),
              TextField(
                onChanged: _onSearchChanged,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 7, bottom: 7, left: 7, right: 7),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      height: 1.2,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(92, 195, 109, 39), width: 1),
                      borderRadius: BorderRadius.zero),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(92, 195, 109, 39), width: 1),
                      borderRadius: BorderRadius.zero),                  
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(92, 195, 109, 39), width: 1),
                      borderRadius: BorderRadius.zero),
                  isDense: true,
                  filled: false,
                ),
              ),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 360
                ),
                child: SingleChildScrollView(
                  child:  BlueBookTable(
                    keyword: keyword,
                  )
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Developed by a Certified Bourbon Professional, use this Tool to search Thousands of Recent Secondary Sales\nPrices for Coveted Bottles of Brown Water*\nA Regularly Updated Resource for Bourbon (and Rye) Valuation",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 10, color: Color(0xffe17f2f)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
