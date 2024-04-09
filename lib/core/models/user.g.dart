// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      userName: json['username'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      avatarURL: json['avatar_url'] as String? ?? '',
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.userName,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarURL,
    };
