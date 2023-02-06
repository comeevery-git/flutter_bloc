import 'package:state_management/src/repository/profile_client.dart';

import '../model/profile.dart';

class ProfileRepository {
  final ProfileClient profileClient;

  ProfileRepository({required this.profileClient});

  Future<dynamic> fetchProfileList() async {
    return await profileClient.getProfileList();
  }

  Future<List<Profile>> getProfileDetail(String email) async {
    return await profileClient.getProfileDetail(email: email);
  }
}
