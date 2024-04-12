part of 'account_cubit.dart';

sealed class AccountState extends Equatable {
  const AccountState();
}

final class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}
