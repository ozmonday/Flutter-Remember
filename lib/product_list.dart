import 'package:flutter/material.dart';
import 'package:waiters/custome_card.dart';
import 'package:waiters/model/product.dart';

class ProductListView extends StatelessWidget {
  final List<Product> productList;
  final Function functionadd;
  final Function functionplus;
  final Function functionmin;
  ProductListView({this.productList, this.functionadd, this.functionplus, this.functionmin});

  void addcart(String productName, double prices, int amaount) {
    functionadd(productName, prices, amaount);
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  padding: const EdgeInsets.all(8.0),
  itemCount: productList.length,
  itemBuilder: (BuildContext context, int index) {
    return CustomeCard(
      index: index, 
      productName: productList[index].productName, 
      prices: productList[index].prices,
      functionAdd: functionadd,
      functionplus: functionplus,
      functionmin: functionmin, );
  },
 
    );
  }
}