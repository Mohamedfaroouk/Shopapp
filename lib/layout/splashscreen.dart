import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text("MyShop",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              )),
        ));
  } //mohamedfarouk@gmail.com
}
