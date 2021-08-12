/* import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

final iconList = <IconData>[
  Icons.brightness_5,
  Icons.brightness_6,
];
int barindex = 0;
double high = 0;
AnimationController? controller;
Animation<double> width =
    Tween<double>(begin: 140, end: 150).animate(controller!);

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller!.addListener(() {
      setState(() {});
    });
    controller!.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          high += 50;
          Timer(Duration(seconds: 3), () {
            high -= 50;
            setState(() {});
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedContainer(
        height: high,
        duration: Duration(milliseconds: 100),
        child: AnimatedBottomNavigationBar.builder(
          height: high,
          leftCornerRadius: 50,
          rightCornerRadius: 50,
          backgroundColor: Colors.black,
          itemCount: iconList.length,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.orange : Colors.white;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 16,
                  color: color,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    "brightness $index",
                    maxLines: 1,
                    textScaleFactor: 3,
                    style: TextStyle(
                      color: color,
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            );
          },
          activeIndex: barindex,
          onTap: (int) {
            setState(() {});
            barindex = int;
            high += 50;
            Timer(Duration(seconds: 3), () {
              high -= 50;
              setState(() {});
            });
          },
        ),
      ),
      body: Center(
        child: Container(
            color: Colors.red, width: width.value, height: width.value),
      ),
    );
  }
}
 */