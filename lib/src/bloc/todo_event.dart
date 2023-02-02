import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';

// cubit 은 event 필요없음

@immutable
abstract class TodoEvent extends Equatable {}

class ListTodosEvent extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final String title; // id, createdAt 은 원래 서버 자동생성이라 title 데이터로만 생성함

  CreateTodoEvent({
    required this.title,
  });

  @override
  List<Object?> get props => [this.title];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent({
    required this.todo,
  });

  @override
  List<Object?> get props => [this.todo];
}
