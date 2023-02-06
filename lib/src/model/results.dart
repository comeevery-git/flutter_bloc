import 'package:freezed_annotation/freezed_annotation.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  late Name name;
  late String gender;
  late String email;
  late Picture picture;
  late String phone;

  Results({
    required this.name,
    required this.gender,
    required this.email,
    required this.picture,
    required this.phone,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

class Name {
  late String? title;
  late String? first;
  late String? last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }
  Map<String, dynamic> toJson() =>
      {'title': title, 'first': first, 'last': last};
}

class Picture {
  late String? large;
  late String? medium;
  late String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }
  Map<String, dynamic> toJson() =>
      {'large': large, 'medium': medium, 'thumbnail': thumbnail};
}
