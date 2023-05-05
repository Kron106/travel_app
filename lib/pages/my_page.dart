import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 80.0,
              backgroundColor: Colors.white.withOpacity(0.8),
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 16.0),
            Text(
              '姓名：张三',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '性别：男',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            ExpandablePanel(
              header: Text(
                '个人爱好',
                style: TextStyle(fontSize: 20.0),
              ),
              collapsed: Text(
                '点击展开',
                style: TextStyle(fontSize: 18.0),
              ),
              expanded: Column(
                children: [
                  ListTile(
                    title: Text('足球'),
                  ),
                  ListTile(
                    title: Text('游泳'),
                  ),
                  ListTile(
                    title: Text('跑步'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandablePanel extends StatefulWidget {
  final Widget header;
  final Widget collapsed;
  final Widget expanded;

  ExpandablePanel({
    required this.header,
    required this.collapsed,
    required this.expanded,
  });

  @override
  _ExpandablePanelState createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.header,
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 32.0,
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          firstChild: widget.collapsed,
          secondChild: widget.expanded,
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
        ),
      ],
    );
  }
}
