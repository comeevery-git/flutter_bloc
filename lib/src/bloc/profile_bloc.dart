import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/profile.dart';
import '../repository/profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._profileRepository) : super(Empty()) {
    on<FetchProfileEvent>(_mapFetchProfileListEvent);
  }
  final ProfileRepository _profileRepository;

  void _mapFetchProfileListEvent(
      FetchProfileEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());

    try {
      // UI 에러를 최소화하기 위해 여기서 모든 에러를 잡음
      final res = await this._profileRepository.fetchProfileList();
      final profile = Profile.fromJson(res);
      // final results = profileRes.results.toList(growable: false); // 길이고정 목록
      // final info = profileRes.info.toJson();

      emit(Loaded(profile: profile));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
