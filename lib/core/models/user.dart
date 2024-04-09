import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class AppUser extends Equatable {
  /// {@macro user}
  const AppUser({
    required this.id,
    required this.email,
    this.userName = '',
    this.fullName = '',
    this.avatarURL = '',
  });

  /// An empty user (unauthenticated).
  static const AppUser empty = AppUser(id: '', email: '');

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  /// The user's id.
  final String id;
  final String email;

  @JsonKey(name: 'username')
  final String userName;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'avatar_url')
  final String avatarURL;

  @override
  List<Object> get props => [id, email, userName, fullName, avatarURL];
}
