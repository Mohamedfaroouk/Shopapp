import 'package:myshop/models/homemodel.dart';

class searchmodel {
  searchmodeldata? data;
  searchmodel.fromjson(Map<String, dynamic> json) {
    data = searchmodeldata.fromjson(json["data"]);
  }
}

class searchmodeldata {
  List<productsmodel> searchproducts = [];
  searchmodeldata.fromjson(Map<String, dynamic>? jason) {
    jason?["data"].forEach((element) {
      searchproducts.add(productsmodel.fromjson(element));
    });
  }
}
