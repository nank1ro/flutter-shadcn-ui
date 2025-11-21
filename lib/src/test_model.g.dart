// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'test_model.dart';

// **************************************************************************
// SerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
  json['name'] as String,
  json['age'] as int,
  Address.fromJson(json['address'] as Map<String, dynamic>),
  (json['hobbies'] as List<dynamic>).cast<String>(),
);

Address _$AddressFromJson(Map<String, dynamic> json) =>
    Address(json['street'] as String, json['city'] as String);

