import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_gson/resources/AppColor.dart';
import 'package:news_app_gson/resources/AppStrings.dart';
import 'package:news_app_gson/ui/pages/NewsListPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: AppColor.themeColor,
        child: Text(
          AppStrings.APP_NAME,
          style: TextStyle(color: AppColor.themeColor, fontSize: 24),
        ),
      ),
    );
  }

  @override
  void initState() {
    Timer(Duration(seconds: 1), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NewsListPage()));
    });
  }
}
