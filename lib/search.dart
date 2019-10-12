import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final searchItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
          children: <Widget>[
            Card(
              elevation: 5,
              margin: EdgeInsets.all(12),
              child: Container(
                margin: EdgeInsets.only(left: 15,bottom: 3,top: 3,right: 15),
                child: TextField(
                  cursorColor: Colors.green,
                  controller: searchItem,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    fillColor: Colors.white,
                    border: InputBorder.none,
                  ),
                  autofocus: false,
                ),
              ),
            ),
            // IconButton(
            //   icon: Icon(Icons.search),
            //   onPressed: () {},
            // )
          ],
      
      ),
    );
  }
}
