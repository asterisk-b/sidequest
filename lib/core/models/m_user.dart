import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sidequest/core/models/_enums.dart';
import 'package:sidequest/core/models/converters/string.dart';

part 'm_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AppUser extends Equatable {
  const AppUser({
    required this.id,
    required this.email,
    required this.wallets,
    this.level = 0,
    this.userName = '',
    this.fullName = '',
    this.avatarURL = '',
    this.bio = '-',
    this.experience = 0,
    this.usernameModified,
  });

  static const AppUser empty = AppUser(id: '', email: '', wallets: []);

  bool get isEmpty => id.isEmpty || email.isEmpty;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  final String id;
  final String email;
  final int level;

  @JsonKey(name: 'username')
  final String userName;

  @JsonKey(name: 'bio')
  final String? bio;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'avatar_url')
  final String avatarURL;

  @JsonKey(
    name: 'username_modified',
    fromJson: StringConverter.toDateTime,
    toJson: StringConverter.fromDateTime,
  )
  final DateTime? usernameModified;

  @JsonKey(
    name: 'experience',
    fromJson: StringConverter.toDouble,
    toJson: StringConverter.fromDouble,
  )
  final double experience;

  final List<Wallet> wallets;

  Wallet get goldWallet {
    return wallets.firstWhere((e) => e.currency == WalletCurrency.gold);
  }

  Wallet get gemWallet {
    return wallets.firstWhere((e) => e.currency == WalletCurrency.gem);
  }

  Wallet getWallet(WalletCurrency currency) {
    return wallets.firstWhere((e) => e.currency == currency);
  }

  @override
  List<Object> get props => [
        id,
        email,
        level,
        userName,
        fullName,
        avatarURL,
        wallets,
      ];
}

@JsonSerializable()
class Wallet extends Equatable {
  const Wallet({
    required this.id,
    this.currency = WalletCurrency.gold,
    this.balance = 0,
  });

  final String id;
  final num balance;

  final WalletCurrency currency;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
  Map<String, dynamic> toJson() => _$WalletToJson(this);

  @override
  List<Object?> get props => [id, balance, currency];
}
