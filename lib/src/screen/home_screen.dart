import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'widget/main_connect_btn.dart';
import 'widget/main_count_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     '',
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      // ),
      // extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'lib/resource/images/home_img.jpg',
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 24, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.favorite,
                                    color: kTextColorAccent, size: 24.0),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text('100',
                                      style: kTextStyle.copyWith(
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(24, 58, 0, 0),
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
                            margin: EdgeInsets.fromLTRB(24, 180, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('가운데\n컨텐츠.',
                                    style:
                                        kTextStyleAccent.copyWith(fontSize: 40))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            MainCountArea(),
            MainConnectBtn(),
          ],
        ),
      ),
    );
  }
}
