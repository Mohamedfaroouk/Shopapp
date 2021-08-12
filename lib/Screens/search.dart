import 'package:flutter/material.dart';
import 'package:myshop/providers/main_provider.dart';
import 'package:provider/provider.dart';

import 'Cart.dart';

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(25)),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      textAlign: TextAlign.end,
                      onChanged: (text) {
                        //value.thesearch(text);
                        value.localsearch(text);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).iconTheme.color,
                          )),
                      textAlignVertical: TextAlignVertical.center,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: value.searchList == null
              ? CircularProgressIndicator()
              : ListView.separated(
                  itemBuilder: (context, index) => cartitem(context,
                      value.mysearchmodel, index, value, value.searchList),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: value.searchList.length));
    });
  }
}
