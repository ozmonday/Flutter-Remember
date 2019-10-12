import 'package:flutter/material.dart';

import 'package:waiters/model/cart_item.dart';
import 'package:waiters/model/product.dart';
import 'package:waiters/search.dart';
import 'package:waiters/struck_list.dart';
import 'package:waiters/product_list.dart';
import 'package:waiters/model/struc.dart';

import 'cart_list.dart';
import 'chips_view.dart';

void main() => runApp(WaitersApp());

class WaitersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.white,
            actionsIconTheme: IconThemeData(color: Colors.blue),
            iconTheme: IconThemeData(color: Colors.blue)),
      ),
      home: HomeSreen(),
      title: "Waiters App",
    );
  }
}

class HomeSreen extends StatefulWidget {
  @override
  _HomeSreenState createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen>
    with SingleTickerProviderStateMixin {
  final searchItem = TextEditingController();
  List<Product> productList = [
    Product(
      productName: "Test 1",
      prices: 13000,
    ),
    Product(
      productName: "Test 2",
      prices: 15000,
    ),
    Product(
      productName: "Test 3",
      prices: 23000,
    ),
    Product(
      productName: "Test 4",
      prices: 34500,
    ),
    Product(
      productName: "Test 5",
      prices: 5000,
    ),
    Product(
      productName: "Test 6",
      prices: 15000,
    ),
    Product(
      productName: "Test 7",
      prices: 23000,
    ),
    Product(
      productName: "Test 8",
      prices: 34500,
    ),
    Product(
      productName: "Test 9",
      prices: 5000,
    ),
    Product(
      productName: "Test 10",
      prices: 15000,
    ),
    Product(
      productName: "Test 11",
      prices: 23000,
    ),
    Product(
      productName: "Test 12",
      prices: 34500,
    ),
    Product(
      productName: "Test 13",
      prices: 5000,
    ),
  ];
  List<CartItem> cartList = [];
  List<Struck> transactionList = [];

  void addstruck(num total, String kode, List<Product> barang) {
    Struck data = Struck(
      kodeTransaksi: kode,
      daftarBarang: barang,
      totalPembayaran: total,
    );
    setState(() {
      transactionList.add(data);
    });
    cartList.clear();
  }

  void addcart(String productName, double prices) {
    CartItem data = CartItem(
      productName: productName,
      prices: prices,
      amaount: 1,
    );

    for (CartItem test in cartList) {
      if (test.productName == data.productName && test.prices == data.prices) {
        setState(() {
          test.plus();
        });
        return;
      }
    }
    setState(() {
      cartList.add(data);
    });
  }

  void plusamaount(index) {
    setState(() {
      cartList[index].plus();
    });
  }

  void minamaount(index) {
    setState(() {
      cartList[index].min();
    });
  }

  void removecart(index) {
    setState(() {
      cartList.removeAt(index);
    });
  }

  void cart() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CartListView(
                    cartList: cartList,
                    remove: removecart,
                    addstruck: addstruck,
                    plusOne: plusamaount,
                    minOne: minamaount,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "PayMaster",
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 25,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black26,
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListGroup(transactionList)));
              });
            },
            icon: Icon(
              Icons.assignment,
            ),
            iconSize: 28,
          ),
          IconButton(
            color: Colors.black26,
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
            iconSize: 28,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //SearchWidget(),
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.74,
                          margin: EdgeInsets.only(
                            left: 15,
                            bottom: 3,
                            top: 3,
                          ),
                          child: TextField(
                            cursorColor: Colors.green,
                            controller: searchItem,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: "Search ID...",
                              fillColor: Colors.white,
                              border: InputBorder.none,
                            ),
                            autofocus: false,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            CustomeChipsView(
              chipsList: cartList,
              delet: removecart,
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ProductListView(
                  productList: productList,
                  functionadd: addcart,
                  functionplus: plusamaount,
                  functionmin: minamaount,
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: cart,
        child: Icon(Icons.shopping_cart),
      ),
      //CartListView(cartList: cartList, remove: removecart, addstruck: addstruck, plusOne:plusamaount, minOne: minamaount,)
    );
  }
}
