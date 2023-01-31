import 'package:flutter/material.dart';

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
              '-----------------',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black38,
              ),
            ),
          ),
          Container(
            child: Text(
              '15,420회',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6D49FE),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
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
          ),
        ],
      ),
    );
  }
}
