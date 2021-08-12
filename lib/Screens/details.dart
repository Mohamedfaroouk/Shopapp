import 'dart:async';

import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:myshop/layout/homepage.dart';
import 'package:myshop/models/homemodel.dart';
import 'package:myshop/providers/main_provider.dart';
import 'package:myshop/shared/widgets/custom_widget.dart';
import 'package:provider/provider.dart';

class details extends StatefulWidget {
  final productsmodel model;

  const details(this.model, {Key? key}) : super(key: key);
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  AnimateIconController? productAnimatcontroller;
  double x = 0;
  double y = 0;
  @override
  void initState() {
    // TODO: implement initState

    productAnimatcontroller = AnimateIconController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<MainProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: width,
                    height: height * 0.4,
                    child: FadeInImage(
                      imageErrorBuilder: (Context, Object _, StackTrace? __) {
                        return Image.asset('assets/images/Fidget-spinner.gif');
                      },
                      image: NetworkImage("${widget.model.image}"),
                      fit: BoxFit.contain,
                      placeholder:
                          AssetImage('assets/images/Fidget-spinner.gif'),
                    )),
                SizedBox(
                  height: height * 0.03,
                ),
                Wrap(
                  children: [
                    Text(
                      "${widget.model.name}",
                      textScaleFactor: 2,
                    ),
                    Text(
                      "${widget.model.price} EGP",
                      textScaleFactor: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      textScaleFactor: 1.2,
                    )),
                Divider(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    children: [
                      Text(
                        "${widget.model.description}",
                        style: Theme.of(context).textTheme.caption,
                        textScaleFactor: 1,
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(children: [
                  Spacer(),
                  myanimationicon(
                      Icons.favorite_outline,
                      Icons.favorite,
                      productAnimatcontroller,
                      Colors.black,
                      Colors.red,
                      context),
                  Divider(),
                  AnimateIcons(
                    startIcon: value.startcarticons(widget.model.incart!),
                    endIcon: value.endcarticons(widget.model.incart!),
                    size: MediaQuery.of(context).size.width * 0.067,
                    controller: productAnimatcontroller!,
                    onStartIconPress: () {
                      value.addtocart(widget.model.id);
                      return true;
                    },
                    onEndIconPress: () {
                      print("Clicked on Close Icon");
                      value.addtocart(widget.model.id);
                      return true;
                    },
                    duration: Duration(milliseconds: 500),
                    startIconColor:
                        value.startcarticonscolor(widget.model.incart!),
                    endIconColor: value.endcarticonscolor(widget.model.incart!),
                    clockwise: false,
                  ),
                ]),
              ],
            ),
          ),
        ),
      );
    });
  }
}

/* Widget backgroundcart(context) => Scaffold(
      body: Column(
        children: [
          Spacer(),
          Container(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child:
                        /* AnimatedList(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index, a) =>
                        Provider.of<MainProvider>(context).aaa[index],
                    initialItemCount:
                        Provider.of<MainProvider>(context).aaa.length,
                  ),
               */
                        ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                Provider.of<MainProvider>(context).aaa[index],
                            separatorBuilder: (context, index) => Divider(),
                            itemCount:
                                Provider.of<MainProvider>(context).aaa.length))
              ],
            ),
          ),
        ],
      ),
    );

int indexx = 5; */
