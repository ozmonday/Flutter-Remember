import 'package:waiters/model/product.dart';

class CartItem extends Product {
  int amaount =  0;
  void plus() {
    amaount++;
  }

  void min() {
    amaount--;
  }

  CartItem({String productCode,String productName, double prices, this.amaount}) :super(productCode:productCode,productName:productName,prices:prices);


}