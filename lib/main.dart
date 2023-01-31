import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/count_observer.dart';
import 'bloc/view/community_page.dart';
import 'bloc/view/counter_page.dart';
import 'bloc/view/setting_page.dart';
import 'bloc/view/widget/bottom_bar.dart';
import 'bloc/view/widget/main_connect_btn.dart';
import 'bloc/view/widget/main_count_area.dart';

void main() {
  Bloc.observer = CountObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeNotifier = Provider<ThemeNotifier>(context);
    return MaterialApp(
      title: 'State Manager - Bloc Main',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          length: 4,
          child: Scaffold(
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomePage(),
                CommunityPage(),
                CounterPage(),
                SettingPage()
              ],
            ),
            bottomNavigationBar: BottomBar(),
          )),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Manager'),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 300,
                          child: Image.asset('lib/images/home_img.jpg',
                              fit: BoxFit.cover),
                        ),
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
                                    fontSize: 15,
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
                                  color: Colors.pink, size: 24.0),
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                  '평생 딱 한번 첫! 구매 반값 이벤트',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFFFCFCFC),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(24, 182, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '무엇이든\n이야기해요.',
                                style: TextStyle(
                                  fontSize: 38,
                                ),
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
            ],
          ),
        ),
      ),
    );
  }
}
