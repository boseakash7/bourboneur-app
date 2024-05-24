import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key, required this.label, this.checked = false, this.onChanged});

  final String label;
  bool checked;
  void Function(bool? value)? onChanged;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  bool? value;

  @override
  void initState() {
    
    value = widget.checked;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(      
      decoration: BoxDecoration(
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [         
          Checkbox(             
            side: const BorderSide(
              color: Colors.white
            ),  
            value: value,
            onChanged: (bool? value) {
              if ( widget.onChanged != null ) widget.onChanged!(value);
              setState(() {
                this.value = value;
              });
          }),
          GestureDetector(
            onTap: () {              
              setState(() {
                value = !value!;
              });
              if ( widget.onChanged != null ) widget.onChanged!(value);
            },
            child: Text(widget.label, style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white
            )),
          ),
          
        ],
      ),
    );
  }
}