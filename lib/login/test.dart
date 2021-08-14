import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:myshop/layout/homepage.dart';
import 'package:myshop/login/customroate.dart';
import 'package:myshop/shared/constatns.dart';
import 'package:myshop/shared/remote/dio_helper.dart';

const users = const {
  'farouk@gmail.com': '123456',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => const Duration(milliseconds: 2250);
  static const routeName = '/auth';
  Future<String?> _authUser(LoginData data) {
    String? valid;
    diohelp.postdata(text: "login", data: {
      "email": data.name,
      "password": data.password,
    }).then((value) {
      theusername = value.data["data"]["name"];
      valid = value.data["data"]["name"];
      token = value.data["data"]["token"];
    }).then((value) => null);

    // print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(const Duration(seconds: 3)).then((_) {
      if (valid == null) {
        return 'The User or Password are invalid ';
      }

      return null;
    });
  }

  Future<String?> _regUser(RegData data) {
    //print('Name: ${data.name}, Password: ${data.password}');
    print(theusername);
    String? valid;
    diohelp.postdata(text: "register", data: {
      "name": data.myname,
      "email": data.name,
      "password": data.password,
      "phone": data.myphone,
    }).then((value) {
      theusername = value.data["data"]["name"];
      valid = value.data["data"]["name"];
      token = value.data["data"]["token"];
      print(theusername);
    });
    return Future.delayed(const Duration(seconds: 3)).then((_) {
      if (valid == null) {
        return 'The User Data already exeited ';
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
          inputTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.black12,
          ),
          primaryColor: Colors.blue,
          pageColorLight: Colors.blue,
          pageColorDark: Colors.lightBlue,
          titleStyle: TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(.9),
                blurRadius: 1,
                offset: const Offset(1, 1),
              )
            ],
          )),
      userType: LoginUserType.phone,
      logoTag: "logotag",
      messages: LoginMessages(nameHint: "Name", phoneHint: "Phone number"),
      title: 'MyShop',
      onLogin: (LoginData) => _authUser(LoginData),
      onSignup: (RegData) => _regUser(RegData),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => const home(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
