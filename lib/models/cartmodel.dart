import 'package:myshop/models/homemodel.dart';

class cartmodel {
  cartmodeldata? data;
  cartmodel.fromjson(Map<String, dynamic> json) {
    data = cartmodeldata.fromjson(json["data"]);
  }
}

class cartmodeldata {
  List<productsmodel> cartproducts = [];
  cartmodeldata.fromjson(Map<String, dynamic>? jason) {
    jason?["cart_items"].forEach((element) {
      if (cartproducts.contains(productsmodel.fromjson(element["product"]))) {
      } else {
        cartproducts.add(productsmodel.fromjson(element["product"]));
      }
    });
  }
}
