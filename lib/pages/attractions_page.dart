
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AttractionPage extends StatefulWidget {
  const AttractionPage({Key? key}) : super(key: key);

  @override
  State<AttractionPage> createState() => _AttractionPageState();
}

class _AttractionPageState extends State<AttractionPage> {
  String showResult = '';
  String xx='';

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('https://www.fastmock.site/mock/abe5e32eb3b2947f9304765e60fcf005/travel/get/findattraction.do');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }

  @override
  void initState() {
    super.initState();
    fetchPost().then((CommonModel value) {
      setState(() {
        showResult = '请求结果：\nhideAppBar：${value.name}\nicon：${value.description}';
        xx=value.photo;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Http'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              '数据已加载：',
              style: TextStyle(fontSize: 26),
            ),
            Text(showResult),
            Image.network(xx),
          ],
        ),
      ),
    );
  }
}

class CommonModel {
  final String name;
  final String photo;
  final String description;
  CommonModel(
      {required this.name,
        required this.photo,
        required this.description});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      name: json['name'],
      photo: json['photo'],
      description: json['description'],
    );
  }
}
