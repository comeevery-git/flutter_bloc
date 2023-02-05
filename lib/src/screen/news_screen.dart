import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'retrofit/rest_client.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late RestClient client;

  @override
  void initState() {
    super.initState();

    Dio dio = Dio();
    client = RestClient(dio);

    Future.microtask(() async {
      final res = await client.getTopNews();
      print(res);
    });
  }

  renderNewsCard({
    required News news,
  }) {
    return Card(
      child: Column(
        children: [
          Text(news.id.toString()),
          Text(news.title.toString()),
          Text(news.type.toString()),
          Text(news.url.toString()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RECENT NEWS'),
      ),
      body: Center(
        child: FutureBuilder(
          future: client.getTopNews(),
          initialData: [],
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 요청중
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            ;

            final ids = snapshot.data;
            return ListView.builder(itemBuilder: (_, index) {
              return FutureBuilder(
                future: client.getNewsDetail(id: ids[index]),
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // 요청중
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (!snapshot.hasData) {
                    // 데이터가 정상적으로 들어오지 않았을 때
                    return Center(
                      child: Text(
                        "문제가 발생했습니다",
                        style: TextStyle(color: Colors.amber),
                      ),
                    );
                  } else {
                    return renderNewsCard(news: snapshot.data);
                  }
                },
              );
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: Icon(Icons.share_outlined),
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
                      title: Text('Share'),
                    ),
                    ListTile(
                      leading: Icon(Icons.copy),
                      title: Text('Copy Link'),
                    ),
                    ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('Edit'),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
