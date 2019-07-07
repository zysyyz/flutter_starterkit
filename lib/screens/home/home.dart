import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../exports.dart';
import './tab_homepage.dart';
import './tab_mine.dart';

class _IconWithBadge extends StatelessWidget {
  final String icon;
  Color color;
  int badgeNumber;

  _IconWithBadge(
    this.icon, {
    Key key,
    this.color = Colors.grey,
    this.badgeNumber = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          height: 20,
          width: 20,
          color: color,
          margin: EdgeInsets.only(top: 6, left: 12, right: 12),
          child: Image.asset(icon, color: color, width: 20),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: badgeNumber <= 0 ? Container() : Badge(number: this.badgeNumber),
        )
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _scenes = [
    TabHomepageScene(),
    TabMineScene(),
    TabMineScene(),
  ];
  int _selectedIndex = 0;

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: _scenes
        .asMap()
        .map((index, value) {
          bool isSelected = _selectedIndex == index;
          return MapEntry(
            index,
            Offstage(
              offstage: isSelected,
              child: TickerMode(
                enabled: isSelected,
                child: value,
              ),
            ));
        })
        .values
        .toList(),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    final tabBarItems = [
      {
        'title': '首页',
        'icon': 'assets/images/ic_tab_homepage.png',
        'badgeNumber': 0,
      },
      {
        'title': '我的',
        'icon': 'assets/images/ic_tab_mine.png',
        'badgeNumber': 0,
      },
      {
        'title': '我的',
        'icon': 'assets/images/ic_tab_mine.png',
        'badgeNumber': 10,
      }
    ];

    return CupertinoTabBar(
      backgroundColor: Colors.white,
      border: Border(
        top: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 0.0,
          style: BorderStyle.solid,
        ),
      ),
      items: tabBarItems
        .asMap()
        .map((index, value) {
          return MapEntry(
            index,
            BottomNavigationBarItem(
              icon: _IconWithBadge(value['icon'], color: Colors.grey, badgeNumber: value['badgeNumber']),
              // activeIcon: _IconWithBadge(icon: icon, color: Colors.black, badgeNumber: badgeNumber),
              title: Text(value['title'], style: TextStyle(fontSize: 10)),
            ),
          );
        })
        .values
        .toList(),
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }
}
