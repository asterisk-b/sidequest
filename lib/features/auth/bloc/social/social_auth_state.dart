part of 'social_auth_cubit.dart';

sealed class SocialAuthState extends Equatable {
  const SocialAuthState();
}

final class SocialAuthInitial extends SocialAuthState {
  @override
  List<Object> get props => [];
}
