import 'package:flutter/material.dart';

class MainConnectBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6D49FE),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '이야기 시작해볼까요?',
                style: TextStyle(
                  fontSize: 20,
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
