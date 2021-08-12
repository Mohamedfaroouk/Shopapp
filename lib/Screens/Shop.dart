import 'package:animate_icons/animate_icons.dart';
import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myshop/Screens/Cart.dart';
import 'package:myshop/Screens/details.dart';
import 'package:myshop/layout/homepage.dart';
import 'package:myshop/models/homemodel.dart';
import 'package:myshop/providers/main_provider.dart';
import 'package:myshop/shared/remote/dio_helper.dart';
import 'package:myshop/shared/widgets/custom_widget.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  AnimateIconController? productAnimatcontroller;
  @override
  void initState() {
    productAnimatcontroller = AnimateIconController();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<MainProvider>(builder: (context, value, child) {
      return value.mymodel == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: value.mymodel!.data!.banners!
                          .map(
                            (e) => FadeInImage(
                              width: width * 0.9,
                              imageErrorBuilder:
                                  (Context, Object _, StackTrace? __) {
                                return Image.asset(
                                    'assets/images/Fidget-spinner.gif');
                              },
                              image: NetworkImage(
                                e.image!,
                              ),
                              fit: BoxFit.cover,
                              placeholder: AssetImage(
                                  'assets/images/Fidget-spinner.gif'),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: height * 0.25,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Products",
                        textScaleFactor: 2,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      childAspectRatio: 1 / 2,
                      children: List.generate(
                          value.mymodel!.data!.products!.length,
                          (index) => Productbuilder(value, index)),
                    )
                  ],
                ),
              ),
            );
    });
  }

  Widget Productbuilder(MainProvider value, index) {
    var thedata = value.mymodel!.data!.products;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: Duration(milliseconds: 500),
              closedBuilder: (context, opencontainer) {
                return Align(
                  alignment: Alignment.center,
                  child: FadeInImage(
                    width: width * 0.4,
                    height: height * 0.4,
                    imageErrorBuilder: (Context, Object _, StackTrace? __) {
                      return Image.asset('assets/images/Fidget-spinner.gif');
                    },
                    image: NetworkImage("${thedata![index].image}"),
                    fit: BoxFit.contain,
                    placeholder: AssetImage('assets/images/Fidget-spinner.gif'),
                  ),
                );
              },
              openBuilder: (_, __) {
                return details(thedata![index]);
              },
            )),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Container(
                  width: width * 0.25,
                  child: Wrap(
                    children: [
                      Text(
                        "${thedata![index].name}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    "${thedata[index].price.round()} EGP",
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Divider(),
            Row(children: [
              AnimateIcons(
                startIcon: Icons.favorite_outline,
                endIcon: Icons.favorite,
                size: MediaQuery.of(context).size.width * 0.067,
                controller: productAnimatcontroller!,
                onStartIconPress: () {
                  return true;
                },
                onEndIconPress: () {
                  print("Clicked on Close Icon");

                  return true;
                },
                duration: Duration(milliseconds: 500),
                startIconColor: Colors.black,
                endIconColor: Colors.red,
                clockwise: false,
              ),
              Spacer(),
              AnimateIcons(
                startIcon: value.startcarticons(thedata[index].incart!),
                endIcon: value.endcarticons(thedata[index].incart!),
                size: MediaQuery.of(context).size.width * 0.067,
                controller: productAnimatcontroller!,
                onStartIconPress: () {
                  value.addtocart(thedata[index].id);
                  return true;
                },
                onEndIconPress: () {
                  print("Clicked on Close Icon");
                  value.addtocart(thedata[index].id);
                  return true;
                },
                duration: Duration(milliseconds: 500),
                startIconColor:
                    value.startcarticonscolor(thedata[index].incart!),
                endIconColor: value.endcarticonscolor(thedata[index].incart!),
                clockwise: false,
              ),
            ]),
          ],
        ),
      ),
      elevation: 2,
      shadowColor: Colors.black87,
      color: Colors.white,
    );
  }
}
