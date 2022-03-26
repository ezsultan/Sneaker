import 'package:bloc/bloc.dart';
import 'auth_states.dart';
import '../service/auth_service.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit({required this.auth}) : super(InitialState()) {
    emit(LoginState());
  }

  final AuthServices auth;
  late final token;
  Future signIn(
    String email,
    String password,
  ) async {
    try {
      emit(LoadingState());
      token = await auth.login(
        email: email,
        password: password,
      );
      emit(
        LoggedState(token),
      );
    } catch (e) {
      emit(FailedState(e.toString()));
    }
  }

  Future signUp(
    String name,
    String username,
    String email,
    String password,
  ) async {
    try {
      emit(LoadingState());
      token = await auth.register(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      emit(
        LoggedState(token),
      );
    } catch (e) {
      emit(
        FailedState(e.toString()),
      );
    }
  }
}
