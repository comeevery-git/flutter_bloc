import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/todo.dart';
import '../repository/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  /**
   * 7.2 ver
  TodoBloc({
    required this.repository,
  }) : super(Empty());

  // Stream => async*
  // Future => async
  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is ListTodosEvent) {
      yield* _mapListTodosEvent(event);
    } else if (event is CreateTodoEvent) {
      yield* _mapCreateTodoEvnet(event);
    } else if (event is DeleteTodoEvent) {
      yield* _mapDeleteTodoEvnet(event);
    }
  }
   */

  /**
   * 8.0 ver
   */
  TodoBloc(this._todoRepository) : super(Empty()) {
    on<ListTodosEvent>(_mapListTodosEvent);
    on<CreateTodoEvent>(_mapCreateTodoEvnet);
    on<DeleteTodoEvent>(_mapDeleteTodoEvnet);
  }
  final TodoRepository _todoRepository;

  /**
   * 7.2 ver
   */
  // Strema => yield*: 뒤에 오는 Stream 이 모든 값을 다 yield 할 때까지 기다리고 발생한 모든 값을 yield
  // Future => yield: 스트림에서 값 생산 시 사용
  // return => 실행하자마자 함수 종료, Stream 은 더이상 이벤트가 없거나 명시적으로 종료하기 전에는 계속 값을 생상할 수 있어서 yield 키워드 사용
  // Stream<TodoState> _mapListTodosEvent(ListTodosEvent event) async* {
  //   try {
  //     // UI 에러를 최소화하기 위해 여기서 모든 에러를 잡음

  //     yield Loading(); // indicator 등 상태 실행

  //     final res = await this.repository.listTodo();
  //     final todos = res.map<Todo>((e) => Todo.fromJson(e)).toList();
  //     yield Loaded(todos: todos);

  //     await this.repository.listTodo();
  //   } catch (e) {
  //     yield Error(message: e.toString());
  //   }
  // }

  /**
   * 8.0 ver
   */
  void _mapListTodosEvent(ListTodosEvent event, Emitter<TodoState> emit) async {
    emit(Loading()); // indicator 등 상태 실행

    try {
      // UI 에러를 최소화하기 위해 여기서 모든 에러를 잡음
      final res = await this._todoRepository.listTodo();
      // final todos = res.map<Todo>((e) => Todo.fromJson(e)).toList();
      final todos = res.map<Todo>((e) => Todo.fromJson(e)).toList();
      emit(Loaded(todos: todos));

      // emit(await this._todoRepository.listTodo()); // ?
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _mapCreateTodoEvnet(
      CreateTodoEvent event, Emitter<TodoState> emit) async {
    try {
      if (state is Loaded) {
        // final parsedState = state // BlocBase getState
        final parsedState = (state as Loaded);

        final newTodo = Todo(
          id: parsedState.todos[parsedState.todos.length - 1].id + 1,
          title: event.title,
          createdAt: DateTime.now().toString(),
        );

        // 기존 상태 저장
        final prevTodos = [
          ...parsedState.todos,
        ];

        // 새로 생기는 상태
        final newTodos = [
          ...prevTodos,
          newTodo,
        ];

        emit(Loaded(todos: newTodos)); // 완료로 강제 지정

        final res = await this._todoRepository.createTodo(newTodo);
        emit(Loaded(todos: [
          ...prevTodos,
          Todo.fromJson(res),
        ])); // 사실 여기서 완료되면 호출
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _mapDeleteTodoEvnet(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      if (state is Loaded) {
        final newTodos = (state as Loaded)
            .todos
            .where((todo) => todo.id != event.todo.id)
            .toList();

        emit(Loaded(todos: newTodos));

        await this._todoRepository.deleteTodo(event.todo);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
