import 'package:flutter/material.dart';

class MainConnectBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF6D49FE),
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Text(
                  '이야기 시작해볼까요?',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFFFCFCFC),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
