import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../utils/constants.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String title = '';

  @override
  void initState() {
    super.initState();

    // 서브트리에서 Bloc 참조하여 사용하기, Bloc add
    BlocProvider.of<TodoBloc>(context).add(ListTodosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                this.title = val;
              },
            ),
            kSizeBox,
            // TodoBloc 에서 emit 발생 시 대응가능
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (_, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Error) {
                    return Container(child: Text(state.message));
                  } else if (state is Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Loaded) {
                    final items = state.todos;

                    return ListView.separated(
                        itemBuilder: (_, index) {
                          final item = items[index];

                          return Row(
                            children: [
                              Expanded(
                                child: Text(item.title),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(Icons.delete),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (_, index) => Divider(),
                        itemCount: items.length);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
