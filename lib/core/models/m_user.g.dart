// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      id: json['id'] as String,
      email: json['email'] as String,
      wallets: (json['wallets'] as List<dynamic>)
          .map((e) => Wallet.fromJson(e as Map<String, dynamic>))
          .toList(),
      level: json['level'] as int? ?? 0,
      userName: json['username'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      avatarURL: json['avatar_url'] as String? ?? '',
      bio: json['bio'] as String? ?? '-',
      experience: json['experience'] == null
          ? 0
          : StringConverter.toDouble(json['experience']),
      usernameModified:
          StringConverter.toDateTime(json['username_modified'] as String?),
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'level': instance.level,
      'username': instance.userName,
      'bio': instance.bio,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarURL,
      'username_modified':
          StringConverter.fromDateTime(instance.usernameModified),
      'experience': StringConverter.fromDouble(instance.experience),
      'wallets': instance.wallets.map((e) => e.toJson()).toList(),
    };

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      id: json['id'] as String,
      currency:
          $enumDecodeNullable(_$WalletCurrencyEnumMap, json['currency']) ??
              WalletCurrency.gold,
      balance: json['balance'] as num? ?? 0,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': _$WalletCurrencyEnumMap[instance.currency]!,
    };

const _$WalletCurrencyEnumMap = {
  WalletCurrency.gold: 'gold',
  WalletCurrency.gem: 'gem',
};
