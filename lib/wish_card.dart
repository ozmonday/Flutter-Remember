import 'package:flutter/material.dart';

class WishCard extends StatelessWidget {
  final index;
  final String productName;
  final num prices;
  final num amaount;
  final Function plusOne;
  final Function minOne;
  final Function remove;

  WishCard(
      {this.index,
      this.productName,
      this.prices,
      this.amaount,
      this.remove,
      this.plusOne,
      this.minOne});

  void delet() {
    remove(index);
  }

  void plus() {
    plusOne(index);
  }

  void min() {
    minOne(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black38, width: 1),
        ),
      ),
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              productName,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40, right: 20),
            child: Text(
              "Rp." + prices.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_circle),
                  color: Colors.green,
                  onPressed: plus,
                ),
                Text(
                  amaount.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                amaount <= 1
                    ? IconButton(
                        color: Colors.red,
                        iconSize: 24,
                        icon: Icon(Icons.cancel),
                        onPressed: delet,
                      )
                    : IconButton(
                        icon: Icon(Icons.remove_circle),
                        color: Colors.red[600],
                        onPressed: min,
                      )
              ],
            ),
          )     
        ],
      ),
    );
  }
}
