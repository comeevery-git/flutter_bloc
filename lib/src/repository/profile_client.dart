import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as rf;

import '../model/profile.dart';

part 'profile_client.g.dart';

@rf.RestApi(baseUrl: 'https://randomuser.me/api')
abstract class ProfileClient {
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @rf.GET('/?results=3')
  @rf.Headers({
    'contentType': 'application/json',
  })
  Future<dynamic> getProfileList();

  // jennie.nichols@example.com
  @rf.GET('/?email={email}.json')
  @rf.Headers({
    'contentType': 'application/json',
  })
  Future<List<Profile>> getProfileDetail({@rf.Path() required email});
}
