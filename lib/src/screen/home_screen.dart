import 'package:flutter/material.dart';

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
                                    color: Colors.pink, size: 24.0),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text(
                                    '100',
                                    style: TextStyle(
                                      color: Color(0xFFFCFCFC),
                                      fontSize: 20,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
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
                                    color: Colors.pink, size: 18.0),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: Text(
                                    '평생 딱 한번 첫! 구매 반값 이벤트',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFFCFCFC),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(24, 180, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '가운데\n컨텐츠.',
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
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
