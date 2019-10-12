import 'package:flutter/material.dart';
import 'package:waiters/model/cart_item.dart';
import 'package:waiters/wish_card.dart';

class CartListView extends StatefulWidget {
  final Function addstruck;
  final List<CartItem> cartList;
  final Function remove;
  final Function plusOne;
  final Function minOne;
  CartListView(
      {this.cartList, this.remove, this.addstruck, this.plusOne, this.minOne});

  @override
  _DrinkListState createState() => _DrinkListState();
}

class _DrinkListState extends State<CartListView> {
  final nominal = TextEditingController();

  num uangMasuk;
  num get kembalian {
    return uangMasuk - totalsum;
  }

  num get totalsum {
    num sum = 0;
    widget.cartList.forEach((item) {
      sum += (item.prices * item.amaount);
    });
    return sum;
  }

  String get total {
    return totalsum == 0 ? "0" : totalsum.toString();
  }

  void pay() {
    num diterima = num.parse(nominal.text);
    if (diterima >= totalsum) {
      setState(() {
        uangMasuk = diterima;
      });
    }
  }

  void addData() {
    widget.addstruck(totalsum, "kodeksosng", widget.cartList);
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("data ditambahkan ke daftar transaksi"),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.blue,
    ));
  }

  void remove(index) {
    setState(() {
      widget.remove(index);
    });
  }

  void plusone(index) {
    setState(() {
      widget.plusOne(index);
    });
  }

  void minone(index) {
    setState(() {
      widget.minOne(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 22,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              uangMasuk == null
                  ? Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.orange,
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Bayar :",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: TextField(
                                cursorColor: Colors.green,
                                controller: nominal,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Nominal uang",
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                ),
                                autofocus: false,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 8),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Total : Rp." + total,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      child: Column(
                        children: <Widget>[
                          Text(totalsum.toString()),
                          Text(uangMasuk.toString()),
                          Text(kembalian.toString())
                        ],
                      ),
                    ),
              Container(
                padding: EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Text(
                  "List Item",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                child: Column(
                  children: widget.cartList
                      .asMap()
                      .map(
                        (index, item) => MapEntry(
                            index,
                            WishCard(
                                index: index,
                                productName: item.productName,
                                prices: item.prices,
                                amaount: item.amaount,
                                plusOne: plusone,
                                minOne: minone,
                                remove: remove)),
                      )
                      .values
                      .toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: RaisedButton(
                                color: Colors.blue,
                                child: Text(
                                  "Selesai",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: addData,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: RaisedButton(
                                color: Colors.orange,
                                child: Text(
                                  "Cetak",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: RaisedButton(
                        color: Colors.green,
                        child: Text(
                          "Bayar",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: pay,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
