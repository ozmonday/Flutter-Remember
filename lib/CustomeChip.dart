import 'package:flutter/material.dart';

class CustomeChip extends StatelessWidget {
  final int index;
  final int amaount;
  final Function delet;
  final String productName;

  CustomeChip({this.index, this.amaount, this.delet, this.productName});

  void del() {
    delet(index);
  } 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.5, right:0.5 ),
      child: Chip(
        avatar: CircleAvatar(
          child: Text(amaount.toString()),
        ),
        label: Text(productName),
        onDeleted: del,
      ),
      
    );
  }
}