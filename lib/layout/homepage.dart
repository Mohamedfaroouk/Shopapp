import 'dart:async';

import 'package:animate_icons/animate_icons.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/widgets.dart';
import 'package:myshop/Screens/Cart.dart';
import 'package:myshop/Screens/Shop.dart';
import 'package:myshop/Screens/search.dart';
import 'package:myshop/providers/main_provider.dart';
import 'package:myshop/shared/constatns.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

bool animate = true;
AnimateIconController? searchcontroller;
AnimateIconController? controller;
AnimateIconController? controller2;
AnimateIconController? controller3;
AnimateIconController? controller4;
List<AnimateIconController> animationControllers = [
  controller2!,
  controller3!,
  controller4!
];
List<Widget> Screens = [const Shop(), const Cart()];
double sizey = 0;
double? searchanimation = null;
double sizeX = 0;
double scale = 1;
double rotation = 0;
double circler = 0;
double width = 0;
double height = 0;
int Screenindex = 0;
bool vis = false;
String? username;
List<IconData> Drawericons = [Icons.store, Icons.category, Icons.shopping_cart];
List<String> DrawerLables = ["Shop", "Cart"];
//Animation<double> aniIcon = Tween<double>(begin: 0, end: 1).animate(aniIcon);

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    username = theusername;
    searchcontroller = AnimateIconController();
    controller = AnimateIconController();
    controller2 = AnimateIconController();
    controller3 = AnimateIconController();
    controller4 = AnimateIconController();
    DrawericonsAnimation();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Consumer<MainProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          drawermenuscreen(),
          drawermainscreen(),
        ],
      );
    });
  }

  Widget drawermenuscreen() => Scaffold(
        body: Container(
          width: width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlue,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: width * 0.4,
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: height * 0.07,
                          child: Image.asset(
                            "assets/images/pngwing.com.png",
                            scale: 0.2,
                          )),
                      Text(
                        "$username",
                        maxLines: 1,
                        textScaleFactor: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(.3),
                              blurRadius: 0,
                              offset: const Offset(2, 2),
                            )
                          ],
                          color: Colors.white,
                          height: 2,
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.026,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Draweritem(
                            lable: DrawerLables,
                            icon: Drawericons,
                            index: index),
                        separatorBuilder: (context, index) => SizedBox(
                              height: height * 0.05,
                            ),
                        itemCount: DrawerLables.length),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget drawermainscreen() => GestureDetector(
        onTap: () {
          setState(() {
            closeDrawer();
          });
        },
        child: AnimatedContainer(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.3),
              spreadRadius: 10,
              blurRadius: 0,
              offset: const Offset(-10, 5), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 10,
              blurRadius: 0,
              offset: const Offset(-25, 15), // changes position of shadow
            ),
          ], borderRadius: BorderRadius.circular(circler)),
          transform: Matrix4.translationValues(sizey, sizeX, 0)
            ..scale(scale)
            ..rotateZ(rotation),

          duration: const Duration(milliseconds: 300),
          //transform: Matrix4.rotationY(0),
          child: Scaffold(
            appBar: AppBar(
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        /*              child: Container(
                          width: 34,
                          height: 34,
                          child: Hero(
                            tag: "logotag",
                            child: Image.asset(
                              'images/pngwing.com.png',
                              filterQuality: FilterQuality.high,
                              height: 30,
                            ),
                          ),
                        ),
                      */
                      ),
                      HeroText("MyShop",
                          tag: "titleherotag",
                          viewState: ViewState.shrunk,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.black)),
                      const SizedBox(width: 20),
                    ],
                  ),
                  /*  Row(
                    children: [
                      Hero(
                          tag: "logotag",
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              'images/pngwing.com.png',
                              fit: BoxFit.contain,
                            ),
                          )),
                      HeroText(
                        "MyShop",
                        tag: "titleherotag",
                        viewState: ViewState.shrunk,
                        style: LoginThemeHelper.loginTextStyle,
                      ),
                    ],
                  ),
                */
                ),
                actions: [
                  OpenContainer(
                      closedColor: Theme.of(context).primaryColor,
                      closedElevation: 0,
                      openElevation: 0,
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionType: ContainerTransitionType.fadeThrough,
                      closedBuilder: (context, opencontainer) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: searchanimation,
                                  decoration: BoxDecoration(
                                      border: null,
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Icon(
                                        Icons.search,
                                      ),
                                    ),
                                  ),
                                  /*   child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextField(
                                          textAlign: TextAlign.end,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ) */
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      openBuilder: (_, __) {
                        return search();
                      }),
                ],
                backwardsCompatibility: true,
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 0,
                leading: anmiIcon(
                    Icons.menu,
                    Icons.menu_open_rounded,
                    controller!,
                    Theme.of(context).appBarTheme.iconTheme!.color!)),
            body: Screens[Screenindex],
          ),
        ),
      );

  Widget Draweritem(
          {required List<String> lable,
          required List<IconData> icon,
          required int index}) =>
      InkWell(
        onTap: () {
          setState(() {
            Screenindex = index;
            Timer(const Duration(milliseconds: 150), () {
              setState(() {});
              closeDrawer();
            });
          });
        },
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 5),
                child: anmiIcon(Drawericons[index], Drawericons[index],
                    animationControllers[index], Colors.white)),
            Text(
              "${lable[index]}",
              textScaleFactor: 1.2,
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 0,
                    offset: const Offset(2, 1),
                  )
                ],
                color: Colors.white,
                height: 2,
                fontWeight: FontWeight.w400,
                fontSize: height * 0.025,
              ),
            ),
          ],
        ),
      );

  void opendrawer() {
    if (sizey == 0 && sizeX == 0 && rotation == 0)
      setState(() {
        circler = 40;
        Timer(const Duration(milliseconds: 300), () {
          if (sizey != 0) rotation = -0.12;
          setState(() {});
        });
        scale = 0.75;
        sizeX = MediaQuery.of(context).size.height * 0.2;

        sizey = MediaQuery.of(context).size.width * 0.5;
      });
  }

  void closeDrawer() {
    if (rotation == -0.12 &&
        sizeX == MediaQuery.of(context).size.height * 0.2 &&
        sizey == MediaQuery.of(context).size.width * 0.5) setState(() {});
    sizeX = 0;
    sizey = 0;
    scale = 1;
    rotation = 0;
    circler = 0;
    if (controller!.isEnd()) {
      controller!.animateToStart();
    }
  }

  Widget anmiIcon(IconData startIcon, IconData endIcon,
      AnimateIconController controller, Color color) {
    return AnimateIcons(
      startIcon: startIcon,
      endIcon: endIcon,
      size: width * 0.067,
      controller: controller,
      onStartIconPress: () {
        opendrawer();
        return true;
      },
      onEndIconPress: () {
        print("Clicked on Close Icon");
        closeDrawer();
        return true;
      },
      duration: const Duration(milliseconds: 500),
      startIconColor: color,
      endIconColor: color,
      clockwise: false,
    );
  }
}

void DrawericonsAnimation() {
  Timer(const Duration(seconds: 10), () {
    animationControllers.forEach((element) {
      if (animate == true) if (element.isStart()) {
        element.animateToEnd();
      } else if (element.isEnd()) {
        element.animateToStart();
      }
    });

    DrawericonsAnimation();
  });
}
