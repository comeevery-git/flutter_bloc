import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/src/bloc/profile_event.dart';

import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_state.dart';
import '../../utils/constants.dart';
import '../counter_screen.dart';
import '../setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // bloc add
    BlocProvider.of<ProfileBloc>(context).add(FetchProfileEvent());

    // API Call Test
    // Future.microtask(() async {
    //   final res = await client.getProfileList();
    //   print(res);
    //   print("=============================================");
    //   final profile = Profile.fromJson(res);
    //   print(jsonEncode(profile.results));
    //   print(jsonEncode(profile.results[0].email));
    //   print(profile.info.toJson());
    // });
  }

  _rendorFirstList() {
    return Expanded(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (_, state) {
          if (state is Empty) {
            return Container(
              child: Text('헤헤!', style: kTextStyleAccent),
            );
          } else if (state is Error) {
            return Container(child: Text(state.message));
          } else if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            final items = state.profile;

            return ListView.separated(
                itemBuilder: (_, index) {
                  final item = items.results[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => CounterScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35.0),
                              child: Image.network(
                                item.picture.thumbnail.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name.first.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                kSizeBox,
                                Text(item.email),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('02-06 17:51'),
                                ),
                                kSizeBox,
                                Container(
                                  child: Text(item.gender),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: items.results.length);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  _rendorSecondList() {
    return Expanded(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (_, state) {
          if (state is Empty) {
            return Container(
              child: Text('히히', style: kTextStyleAccent),
            );
          } else if (state is Error) {
            return Container(child: Text(state.message));
          } else if (state is Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            final items = state.profile;

            return ListView.separated(
                itemBuilder: (_, index) {
                  final item = items.results[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SettingScreen()),
                      );
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SettingScreen()),
                                );
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35.0),
                                  child: Image.network(
                                    item.picture.thumbnail.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name.first.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  kSizeBox,
                                  Text(item.email),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text('02-06 17:51'),
                                  ),
                                  kSizeBox,
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 5, top: 1, right: 5, bottom: 1),
                                    decoration: BoxDecoration(
                                      color: kTextColorAccent,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      item.toJson().length.toString(),
                                      style: kTextStyle.copyWith(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: items.results.length);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필 목록'),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        titleTextStyle: kTextStyleAccent,
        iconTheme: IconThemeData(color: kTextColorGrey),
        automaticallyImplyLeading: false, // 뒤로가기 없음
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              print('heart button is clicked, 프로필 목록');
            },
          ),
          Center(
            child: Text(
              '눈',
              textScaleFactor: 1.5,
              style: TextStyle(
                fontSize: 14.0,
                color: kTextColorGrey,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
          )
        ],
      ),
      body: Container(
        child: ContainedTabBarView(
          tabs: [
            Text('첫번째 탭'),
            Text('두번째 탭'),
          ],
          tabBarProperties: TabBarProperties(
            height: 45.0,
            indicatorColor: kTextColorGrey,
            indicatorWeight: 2.0,
            labelColor: kTextColorGrey,
            labelStyle: kTextStyleAccent,
            unselectedLabelColor: Colors.black12,
          ),
          views: [
            // 첫번째 탭
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: kTextColorGrey),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: _rendorFirstList(),
              ),
            ),

            // 두번째 탭
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: kTextColorGrey),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: _rendorSecondList(),
              ),
            ),
          ],
          onChange: (index) => print(index),
        ),
      ),
    );
  }
}
