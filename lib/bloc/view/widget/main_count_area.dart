import 'package:flutter/material.dart';

class MainCountArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '최근 한달 누적 통화 수 10,000회',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFEA3686),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '매칭 설정',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFFCFCFC),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
