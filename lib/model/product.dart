import 'package:flutter/material.dart';
class Product {
  final String productCode;
  final String productName;
  final double prices;
  Product({this.productCode,@required this.productName,@required this.prices});
}