import 'dart:convert';

import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_app_gson/model/EmployeeModel.dart';
import 'package:news_app_gson/model/EmployeeResponse.dart';
import 'package:news_app_gson/model/User.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  List<EmployeeModel> _employeesList = [];
  List<User> userList = [];
  List<String> strList = [];
  List<Widget> normalList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Employee example app'),
            ),
            body: AlphabetListScrollView(
              strList: strList,
              highlightTextStyle: TextStyle(
                color: Colors.red,
              ),
              showPreview: true,
              itemBuilder: (context, index) {
                return normalList[index];
              },
              indexedHeight: (i) {
                return 80;
              },
              keyboardUsage: true,
            )));
  }

  @override
  void initState() {
    readEmployeeData();
  }

  Future<void> readEmployeeData() async {
    final String response =
        await rootBundle.loadString('assets/employees.json');
    List data = json.decode(response);
    _employeesList = EmployeeResponse.fromJson(data).list;
    _employeesList.sort((a, b) =>
        a.firstName.toLowerCase().compareTo(b.firstName.toLowerCase()));

    List<EmployeeModel> users = [];
    for (var i = 0; i < _employeesList.length; i++) {
      if (i % 110 == 0) users.add(_employeesList[i]);
    }
    users.forEach((user) {
      normalList.add(
        Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            title: Text(user.firstName),
            subtitle: Text(user.firstName),
          ),
        ),
      );
      strList.add(user.firstName);
    });

    setState(() {});
  }
}
