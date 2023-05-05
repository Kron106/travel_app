
import 'package:flutter/material.dart';
import 'package:travel_app/pages/attractions_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/hotel_page.dart';
import 'package:travel_app/pages/my_page.dart';
import 'package:travel_app/pages/photograph_page.dart';



void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  final _defaultColor = Colors.grey; //未选中
  final _activeColor = Colors.blue; //选中
  int _currentIndex = 0; //默认选中第一个
  final List<Widget> _pages = [
    HomePage(),
    PhotographPage(),
    AttractionPage(),
    HotelPage(),
    MyPage()
  ];


  var _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
//fixed永远显示底部lab(文字)，shifting只有被选中才会显示底部文字
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                //设置默认图标和颜色
                icon: Icon(
                  Icons.home,
                  color: _defaultColor,
                ),
                //设置选中图标和颜色
                activeIcon: Icon(
                  Icons.home,
                  color: _activeColor,
                ),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.camera_alt,
                  color: _activeColor,
                ),
                label: '旅拍',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.castle,
                  color: _defaultColor,
                ),
                activeIcon: Icon(
                  Icons.castle,
                  color: _activeColor,
                ),
                label:'景点'
                ,
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.hotel,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.hotel,
                    color: _activeColor,
                  ),
                  label:'酒店'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.co_present,
                    color: _defaultColor,
                  ),
                  activeIcon: Icon(
                    Icons.co_present,
                    color: _activeColor,
                  ),
                  label:'我的'
              )
            ],
          ),
        ));
  }
}
