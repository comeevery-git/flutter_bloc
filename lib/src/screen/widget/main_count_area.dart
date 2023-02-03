import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class MainCountArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Text(
              '최근 가입자 수',
              style: TextStyle(fontSize: 20, color: kTextColorGrey),
            ),
          ),
          Container(
            child: Text('15,420회', style: kTextStyleAccent),
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kBackgroundColor,
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('상세보기', style: kTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
