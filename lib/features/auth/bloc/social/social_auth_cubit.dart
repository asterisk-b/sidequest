import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'social_auth_state.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  SocialAuthCubit() : super(SocialAuthInitial());
}
