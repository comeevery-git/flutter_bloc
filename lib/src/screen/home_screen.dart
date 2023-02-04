import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'widget/home_bottom_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'HOME',
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        titleTextStyle: kTextStyleAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.ac_unit,
              color: kTextColorAccent,
            ),
            onPressed: () {
              print('Icon clicked - home');
            },
          ),
          Center(
            child: Text(
              '눈',
              style: kTextStyleAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/resource/images/home_img.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 8),
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    (kBottomContainerHeight * 2),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Icon(Icons.favorite,
                              color: kTextColorAccent, size: 18.0),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                                '당신이 무엇을 상상하던 그 이상',
                                style: kTextStyle,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('가운데\n컨텐츠.',
                              style: kTextStyleAccent.copyWith(fontSize: 40))
                        ],
                      ),
                    ),
                    HomeBottomArea(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
