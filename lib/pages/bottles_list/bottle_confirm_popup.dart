import 'package:flutter/material.dart';

class BottleConfirmPopup extends StatelessWidget {
  BottleConfirmPopup({super.key, this.value, this.text, this.onConfirm});

  Widget? text;
  String? value;
  void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: ContinuousRectangleBorder(
        side: const BorderSide(width: 2, color: Color(0xffe17f2f)),
        borderRadius: BorderRadius.circular(0),
      ),
      backgroundColor: Colors.black,
      content: Container(
          padding: const EdgeInsets.only(left: 0, top: 10, right: 0),
          child: text),
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
  }
}

class BottleAddPopup extends StatelessWidget {
  BottleAddPopup(
      {super.key,
      required this.value,
      required this.isWishList,
      required this.onConfirm});

  String value;
  bool isWishList;
  void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return BottleConfirmPopup(
      text: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "Add ",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: value,
                style: const TextStyle(color: Color(0xffe17f2f)),
              ),
              TextSpan(
                  text: isWishList != true
                      ? " to your collection?"
                      : " to your wishlist?")
            ]),
      ),
      onConfirm: onConfirm,
      value: value,
    );
  }
}

class BottleRemovePopup extends StatelessWidget {
  BottleRemovePopup(
      {super.key,
      required this.value,
      required this.isWishList,
      required this.onConfirm});

  String value;
  bool isWishList;
  void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return BottleConfirmPopup(
      text: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "Remove ",
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: value,
                style: const TextStyle(color: Color(0xffe17f2f)),
              ),
              TextSpan(
                  text: isWishList != true
                      ? " from your collection?"
                      : " from your wishlist?")
            ]),
      ),
      onConfirm: onConfirm,
      value: value,
    );
  }
}
