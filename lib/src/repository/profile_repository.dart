import '../model/profile.dart';
import 'profile_client.dart';

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
