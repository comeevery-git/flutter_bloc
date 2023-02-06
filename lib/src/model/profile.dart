import 'package:freezed_annotation/freezed_annotation.dart';

import 'results.dart';
import 'info.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  List<Results> results = <Results>[];
  Info info = Info();

  Profile({
    required this.results,
    required this.info,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
