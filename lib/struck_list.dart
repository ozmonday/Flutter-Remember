import 'package:flutter/material.dart';

import 'model/struc.dart';

class ListGroup extends StatelessWidget {
  final List<Struck> data;
  ListGroup(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Struck List", style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 22,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: Column(
        children: data.map((data) {
          return Text(data.totalPembayaran.toString());
        }).toList()
      ),
    );
  }
}
