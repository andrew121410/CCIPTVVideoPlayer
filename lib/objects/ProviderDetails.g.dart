// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProviderDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderDetails _$ProviderDetailsFromJson(Map<String, dynamic> json) =>
    ProviderDetails(
      json['prefix'] as String,
      json['url'] as String,
      json['username'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$ProviderDetailsToJson(ProviderDetails instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'url': instance.url,
      'username': instance.username,
      'password': instance.password,
    };
