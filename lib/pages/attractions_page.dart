import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(AttractionPage());
}
class AttractionPage extends StatefulWidget {
  const AttractionPage({Key? key}) : super(key: key);

  @override
  State<AttractionPage> createState() => _AttractionPageState();
}


class _AttractionPageState extends State<AttractionPage> {
  List<dynamic> _travelData = [];

  Future<void> _fetchTravelData() async {
    final url =
        'https://www.fastmock.site/mock/abe5e32eb3b2947f9304765e60fcf005/travel/api/allview';
    final response = await http.get(Uri.parse(url));
    final extractedData = json.decode(response.body) as List<dynamic>;
    setState(() {
      _travelData = extractedData;
    });
  }

  @override
  void initState() {
    _fetchTravelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('景点'),
        ),
        body: ListView.builder(
          itemCount: _travelData.length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(_travelData[index]['景点名']),
            subtitle: Text(_travelData[index]['介绍']),
            leading: Image.network(_travelData[index]['景点图片'],width: 100,
              height: 100,),
          ),
        ),
      ),
    );
  }
}