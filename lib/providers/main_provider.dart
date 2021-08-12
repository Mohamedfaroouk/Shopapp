import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshop/models/cartmodel.dart';
import 'package:myshop/models/homemodel.dart';
import 'package:myshop/models/searchmodel.dart';
import 'package:myshop/shared/remote/dio_helper.dart';

class MainProvider with ChangeNotifier {
  homemodel? mymodel;
  void getdata() {
    diohelp.gethomedata(text: "home").then((value) {
      mymodel = homemodel.fromjson(value.data);
      print(mymodel!.data!.products![0].image);
      notifyListeners();
    });
  }

  cartmodel? cartsmodel;
  void getcartdata() {
    diohelp.gethomedata(text: "carts").then((value) {
      cartsmodel = cartmodel.fromjson(value.data);

      notifyListeners();
    });
  }

  List<IconData> iconss = [Icons.add_shopping_cart, Icons.remove_shopping_cart];
  IconData starticon = Icons.add_shopping_cart;
  IconData endicon = Icons.remove_shopping_cart;
  void addtocart(id) {
    diohelp.postdata(text: "carts", data: {"product_id": id});
    notifyListeners();
    getcartdata();
  }

  void deletcart(id, index) {
    cartsmodel!.data!.cartproducts.removeAt(index);
    addtocart(id);
  }

  searchmodel? mysearchmodel;
  void thesearch(id) {
    mysearchmodel!.data!.searchproducts = [];
    diohelp.postdata(text: "products/search", data: {"text": id}).then((value) {
      mysearchmodel = searchmodel.fromjson(value.data);
    });
    notifyListeners();
  }

  List<productsmodel> searchList = [];
  void localsearch(text) {
    searchList = mymodel!.data!.products!
        .where((element) =>
            element.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    notifyListeners();
  }

//mymodel!.data!.products![index].incart!
  IconData startcarticons(bool elemnte) {
    if (elemnte) {
      return Icons.remove_shopping_cart;
    } else {
      return Icons.add_shopping_cart;
    }
  }

  IconData endcarticons(bool elemnte) {
    if (elemnte) {
      return Icons.add_shopping_cart;
    } else {
      return Icons.remove_shopping_cart;
    }
  }

  Color startcarticonscolor(bool elemnte) {
    if (elemnte) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }

  Color endcarticonscolor(bool elemnte) {
    if (elemnte) {
      return Colors.black;
    } else {
      return Colors.red;
    }
  }
}
