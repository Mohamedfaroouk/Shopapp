class homemodel {
  homemodeldata? data;
  homemodel.fromjson(Map<String, dynamic>? jason) {
    data = homemodeldata.fromjson(jason?["data"]);
  }
}

class homemodeldata {
  List<productsmodel>? products = [];
  List<bannermodel>? banners = [];

  homemodeldata.fromjson(Map<String, dynamic>? jason) {
    jason?["products"].forEach((element) {
      products?.add(productsmodel.fromjson(element));
    });
    jason?["banners"].forEach((element) {
      banners?.add(bannermodel.fromjson(element));
    });
  }
}

class productsmodel {
  int? id;
  double? price;
  String? image;
  String? name;
  String? description;
  bool? incart;
  bool? infave;
  productsmodel.fromjson(Map<String, dynamic>? jason) {
    id = jason?["id"];
    price = jason?["price"];
    image = jason?["image"];
    name = jason?["name"];
    description = jason?["description"];
    incart = jason?["in_cart"];
    infave = jason?["in_favorites"];
  }
}

class bannermodel {
  int? id;
  String? image;

  bannermodel.fromjson(Map<String, dynamic>? jason) {
    id = jason?["id"];

    image = jason?["image"];
  }
}
