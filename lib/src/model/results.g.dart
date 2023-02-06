// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      gender: json['gender'] as String,
      email: json['email'] as String,
      picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'email': instance.email,
      'picture': instance.picture,
      'phone': instance.phone,
    };
