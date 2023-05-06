import 'package:flutter/material.dart';

void main() {
  runApp(HotelPage());
}

class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Hero Animation Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('酒店'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: 1.0,
              curve: Curves.easeInOut,

            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                    ),
                  );
                },
                child: Hero(
                  tag: 'hotel',
                  child: Image.network(
                    'https://ts1.cn.mm.bing.net/th/id/R-C.80d5a189c7c2dbec0d67809619479380?rik=zXtWesuxpMr1kQ&riu=http%3a%2f%2fcdn.cc%2fuploadfiles%2f2020%2f08%2f20200814163451912.jpg&ehk=z8bsrymMvGwDCJA4pvbethv%2fNOun5DEAETaZ2maZxCQ%3d&risl=&pid=ImgRaw&r=0',
                    height: 100,
                    // fit: BoxFit.cover,
                  ),

                ),
              ),
              SizedBox(height: 20),
              // Text('Click the image to see a Hero Animation')
            ],
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'hotel',
          child: Image.network('https://ts1.cn.mm.bing.net/th/id/R-C.80d5a189c7c2dbec0d67809619479380?rik=zXtWesuxpMr1kQ&riu=http%3a%2f%2fcdn.cc%2fuploadfiles%2f2020%2f08%2f20200814163451912.jpg&ehk=z8bsrymMvGwDCJA4pvbethv%2fNOun5DEAETaZ2maZxCQ%3d&risl=&pid=ImgRaw&r=0'),
        ),
      ),
    );
  }
}
