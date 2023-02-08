import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'src/bloc/profile_bloc.dart';
import 'src/bloc/todo_bloc.dart';
import 'src/observer.dart';
import 'src/cubit/count_cubit.dart';
import 'src/repository/profile_client.dart';
import 'src/repository/profile_repository.dart';
import 'src/repository/todo_repository.dart';
import 'src/screen/history/profile_screen.dart';
import 'src/screen/home_screen.dart';
import 'src/screen/widget/custom_navigator.dart';
import 'src/screen/todo_screen.dart';
import 'src/screen/counter_screen.dart';
import 'src/utils/constants.dart';

void main() {
  Bloc.observer = Observer();

  late ProfileClient profileClient;
  Dio dio = Dio();
  profileClient = ProfileClient(dio);

  runApp(
    MultiProvider(
      // BlocProvider: 자식에게 Bloc을 제공하는 위젯
      // MultiProvider: Provider 여러개 등록
      providers: [
        BlocProvider(
          create: (context) =>
              ProfileBloc(ProfileRepository(profileClient: profileClient)),
        ),
        BlocProvider(
          create: (context) => TodoBloc(TodoRepository()),
        ),
        BlocProvider(
          create: (context) => CountCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final themeNotifier = Provider<ThemeNotifier>(context);

    return MaterialApp(
      title: 'MAIN',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
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
    HomeScreen(),
    TodoScreen(),
    CounterScreen(),
    ProfileScreen(),
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
            height: kBottomContainerHeight,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: kBorderColorAccent.withAlpha(80),
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
                    labelColor: kTextColorAccent,
                    unselectedLabelColor: kTextColorGrey,
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
                          Icons.note_add_rounded,
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
                          Icons.person,
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
