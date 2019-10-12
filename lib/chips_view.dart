import 'package:flutter/material.dart';
import 'package:waiters/model/cart_item.dart';

import 'CustomeChip.dart';

class CustomeChipsView extends StatelessWidget {
  final List<CartItem> chipsList;
  final Function delet;
  CustomeChipsView({this.chipsList, this.delet});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: chipsList
            .asMap()
            .map(
              (index, item) => MapEntry(
                index,
                CustomeChip(
                  index: index,
                  amaount: item.amaount,
                  productName: item.productName,
                  delet: delet,
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
