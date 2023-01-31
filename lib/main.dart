import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/count_observer.dart';
import 'bloc/view/utils/custom_navigator.dart';
import 'bloc/view/community_page.dart';
import 'bloc/view/counter_page.dart';
import 'bloc/view/setting_page.dart';
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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pages = [
    HomePage(),
    CommunityPage(),
    CounterPage(),
    SettingPage(),
  ];
  final _navigatorKeyList =
      List.generate(4, (index) => GlobalKey<NavigatorState>());
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // 취소 키 방지
      onWillPop: () async {
        // 취소 키 눌렀을 경우
        return !(await _navigatorKeyList[_currentIndex]
            .currentState!
            .maybePop()); // pop 할 페이지가 있을 때만 동작
      },
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: _pages.map(
              (page) {
                int index = _pages.indexOf(page);
                return CustomNavigator(
                  page: page,
                  navigatorKey: _navigatorKeyList[index],
                );
              },
            ).toList(),
          ),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black12,
                  width: 1.5,
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    labelPadding: EdgeInsets.fromLTRB(32, 5, 32, 5),
                    isScrollable: true,
                    labelColor: Color(0xFFEA3686),
                    unselectedLabelColor: Colors.black12,
                    indicatorColor: Colors.transparent,
                    onTap: (index) => setState(() {
                      _currentIndex = index;
                    }),
                    tabs: const [
                      // 각 탭 생성
                      Tab(
                        icon: Icon(
                          Icons.home,
                          size: 30,
                        ),
                        // child: Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0))
                        // child: Text(
                        //   'HOME',
                        //   style: TextStyle(fontSize: 11),
                        // ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.forum_outlined,
                          size: 30,
                        ),
                        // child: Text(
                        //   'COMMUNITY',
                        //   style: TextStyle(fontSize: 11),
                        // ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.mouse_outlined,
                          size: 30,
                        ),
                        // child: Text(
                        //   'COUNTER',
                        //   style: TextStyle(fontSize: 11),
                        // ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.settings_applications_outlined,
                          size: 30,
                        ),
                        // child: Text(
                        //   'SETTINGS',
                        //   style: TextStyle(fontSize: 11),
                        // ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  'lib/images/home_img.jpg',
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
