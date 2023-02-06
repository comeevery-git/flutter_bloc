import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class FetchProfileEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}
