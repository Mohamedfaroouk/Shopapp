import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget myanimationicon(
        startIcon, endIcon, controller, colorbefor, colorafter, context,
        {onpressfuction, onendpressfunction}) =>
    AnimateIcons(
      startIcon: startIcon,
      endIcon: endIcon,
      size: MediaQuery.of(context).size.width * 0.067,
      controller: controller,
      onStartIconPress: () {
        onpressfuction;
        return true;
      },
      onEndIconPress: () {
        print("Clicked on Close Icon");
        onendpressfunction;
        return true;
      },
      duration: const Duration(milliseconds: 500),
      startIconColor: colorbefor,
      endIconColor: colorafter,
      clockwise: false,
    );
