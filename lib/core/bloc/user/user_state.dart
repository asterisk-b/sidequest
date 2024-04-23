part of 'user_cubit.dart';

class UserState extends Equatable {
  final AppUser user;
  final bool isLoading;

  const UserState({required this.user, this.isLoading = false});

  @override
  List<Object> get props => [user];

  UserState copyWith({
    AppUser? user,
    bool? isLoading,
  }) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
