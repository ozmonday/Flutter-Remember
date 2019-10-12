import 'package:flutter/material.dart';

class CustomeCard extends StatefulWidget {
  final String productName;
  final int index;
  final double prices;
  final Function functionAdd;
  final Function functionplus;
  final Function functionmin;
  CustomeCard(
      {this.index,
      this.productName,
      this.prices,
      this.functionAdd,
      this.functionplus,
      this.functionmin});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomeCard> {


  void add() {
    setState(() {
      widget.functionAdd(widget.productName, widget.prices);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.productName,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Rp." + widget.prices.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Tambah",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: add),
            )
          ],
        ),
      ),
    ));
  }
}
