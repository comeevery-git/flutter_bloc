import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../news_screen.dart';

class HomeBottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Text(
                  '최근 가입자 수',
                  style: TextStyle(fontSize: 20, color: kTextColor),
                ),
              ),
              Container(
                child: Text('15,420명', style: kTextStyleAccent),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kTextColorAccent,
                  ),
                  onPressed: () {
                    // bottom modal
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      builder: (context) {
                        return Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.share),
                              title: Text('상단'),
                            ),
                            ListTile(
                              leading: Icon(Icons.copy),
                              title: Text('컨텐츠'),
                            ),
                            ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('하단버튼영역'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('상세보기', style: kTextStyle),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kTextColorAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NewsScreen()),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                '최신뉴스 구경하기',
                style: TextStyle(
                  fontSize: 22,
                  color: kTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
