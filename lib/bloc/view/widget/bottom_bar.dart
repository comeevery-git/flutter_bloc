import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 70,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            // 각 탭 생성
            Tab(
              icon: Icon(
                Icons.home,
                size: 22,
              ),
              child: Text(
                'HOME',
                style: TextStyle(fontSize: 11),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.forum_outlined,
                size: 22,
              ),
              child: Text(
                'COMMUNITY',
                style: TextStyle(fontSize: 11),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.mouse_outlined,
                size: 22,
              ),
              child: Text(
                'COUNTER',
                style: TextStyle(fontSize: 11),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings_applications_outlined,
                size: 22,
              ),
              child: Text(
                'SETTINGS',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
