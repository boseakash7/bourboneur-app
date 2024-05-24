import 'package:bourboneur/Core/Apis/WOD.dart';
import 'package:bourboneur/Core/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SavePopup extends StatefulWidget {
  SavePopup({super.key, this.onSubmit, this.name});

  String? name;
  void Function(String name)? onSubmit;

  @override
  State<SavePopup> createState() => _SavePopupState();
}

class _SavePopupState extends State<SavePopup> {

  String name = "";
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    if ( widget.name != null ) {
      name = widget.name!;
      textEditingController.value = TextEditingValue(text: name);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)
      ),      
      title: Text(
        'Please enter name',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
      ),
      content: TextField(  
        controller: textEditingController,      
        maxLines: 1,
        onChanged: (String value) {
          if ( value.trim() == "" ) {
            name = "";
          } else {
            name = value;
          }
          setState(() {
            
          });
        },
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontSize: 12, fontFamily: 'Arial'),
        decoration: const InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(color: Color(0xffe07e2f), width: 1)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
                borderSide: BorderSide(color: Color(0xffe07e2f), width: 1))),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("CANCEL",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                      color: const Color(0xffe07e2f),
                      fontWeight: FontWeight.bold
                    ))),
        TextButton(
            onPressed: () {
              if ( name.trim() == "" ) return;
              if ( widget.onSubmit != null ) widget.onSubmit!(name);
            },
            child: Text("SUBMIT",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                      color: name.trim() == "" ?const Color(0xffe07e2f).withOpacity(.5) : const Color(0xffe07e2f),
                      fontWeight: FontWeight.bold
                    )))
      ],
    );
  }
}