import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../model/profile.dart';

@immutable
abstract class ProfileState extends Equatable {}

class Empty extends ProfileState {
  @override
  List<Object> get props => [];
}

class Loading extends ProfileState {
  @override
  List<Object> get props => [];
}

class Error extends ProfileState {
  final String message;
  Error({required this.message});
  @override
  List<Object> get props => [this.message];
}

class Loaded extends ProfileState {
  final Profile profile;
  Loaded({
    required this.profile,
  });
  @override
  List<Object> get props => [this.profile];
}
