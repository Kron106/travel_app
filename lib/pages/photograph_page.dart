import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///拍照APP开发
class PhotographPage extends StatefulWidget {
  @override
  _PhotographPageState createState() => _PhotographPageState();
}

class _PhotographPageState extends State<PhotographPage> {
  List<File> _images = [];

  Future getImage(bool isTakePhoto) async {
    //当选完图片后关闭"拍照和从相册选择"弹窗
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(
//根据是否拍照动态传source,如果拍照用camera,如果用相册用gallery
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('旅拍'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          //对图片进行处理
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _pickImage() {
    //显示一个底部弹窗
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: 160,
          //上下排列
          child: Column(
            children: <Widget>[
              _item('拍照', true),
              _item('从相册选择', false),
            ],
          ),
        ));
  }

  //生成按钮的方法
  _item(String title, bool isTakePhoto) {
    //手势监听
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _genImages() {
    //通过images.map()方法遍历_图片
    return _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            //底部图片有圆角效果
            borderRadius: BorderRadius.circular(5),
            //加载本地图片，fit: BoxFit.fill是图片的显示方式
            child: Image.file(file, width: 120, height: 90, fit: BoxFit.fill),
          ),
          //右上角添加删除按钮
          Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _images.remove(file);
                  });
                },
                child: ClipOval(
                  //圆角删除按钮
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black54),
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      );
      //最后返回的map
    }).toList();
  }
}
