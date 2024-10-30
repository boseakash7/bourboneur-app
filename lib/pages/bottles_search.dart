import 'package:bourboneur/common/login_wrapper.dart';
import 'package:bourboneur/pages/bottles_list/search_input.dart';
import 'package:flutter/material.dart';

class BottlesSearchPage extends StatefulWidget {
  BottlesSearchPage({
    super.key,
    this.isWishList
  });

  bool? isWishList;

  @override
  State<BottlesSearchPage> createState() => _BottlesSearchPageState();
}

class _BottlesSearchPageState extends State<BottlesSearchPage> {
  List<String> items = [
    "Daniel Weller",
    "Weller 12 Year (1.75L)",
    "Weller 12 Year (1L)",
    "Weller 12 Year (700ml)",
    "Weller 12 Year (750ml)",
    "Weller Antique 107 (1.75L)",
    "Weller Antique 107 (1.75L) SP",
    "Weller Antique 107 (750ml)"
  ];

  @override
  Widget build(BuildContext context) {
    return LoginWrapper(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            children: [
              BottlesSearchInput(
                autoFocus: true,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _prepareListItems(),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _prepareListItems() {
    List<Widget> data = [];
    // int i = 0;
    data.addAll(items.map((String value) {
      // i++;
      return BottleSearchItem(
        text: value,
        onTap: () {
          _showConfirm(
              value: value,
              onConfirm: () {
                Navigator.pop(context);
                print("Confirm " + value);
              });
        },
        // isAdded: i % 3 != 0,
      );
    }).toList());

    data.add(GestureDetector(
      child: const Row(children: [
        Expanded(
          child: Text(
            "DON'T SEE IT?  ADD YOUR OWN",
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 18, height: 2, color: Color(0xffe17f2f)),
          ),
        ),
        SizedBox(width: 20),
        Icon(Icons.add_circle, color: Color(0xffe17f2f))
      ]),
    ));

    return data;
  }

  Future<void> _showConfirm({void Function()? onConfirm, String? value}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: ContinuousRectangleBorder(
              side: const BorderSide(
                width: 2,
                color: Color(0xffe17f2f)
              ),
              borderRadius: BorderRadius.circular(0),
            ),            
            content: Container(
              padding: const EdgeInsets.only(left: 0, top: 10, right: 0),
              child: RichText( 
                textAlign: TextAlign.center,               
                text: TextSpan(
                  text: "Add ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                      text: value.toString(),
                      style: const TextStyle(
                        color: Color(0xffe17f2f)
                      ),
                    ),
                    TextSpan(
                      text: widget.isWishList != true ? " to your collection?" : " to your wishlist?"
                    )
                  ]
                ),
                
            )),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      color: Color(0xffe17f2f),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: onConfirm,
                child: const Text(
                  'Ok',
                  style: TextStyle(
                      color: Color(0xffe17f2f),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        });
  }
}

class BottleSearchItem extends StatelessWidget {
  BottleSearchItem({super.key, required this.text, this.isAdded, this.onTap});

  String text;
  bool? isAdded;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18,
                  height: 2,
                  color: isAdded == true
                      ? Colors.grey
                      : Theme.of(context).textTheme.bodyMedium?.color),
            ),
          ),
          SizedBox(width: 20),
          Icon(isAdded == true ? Icons.check_circle : Icons.add_circle,
              color: isAdded == true ? Colors.grey : Color(0xffe17f2f))
        ],
      ),
    );
  }
}
