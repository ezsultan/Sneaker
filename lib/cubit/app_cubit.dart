import 'package:bloc/bloc.dart';
import 'package:sneaker/cubit/app_states.dart';
import 'package:sneaker/service/auth_service.dart';

class AppCubit extends Cubit<CubitStates> {
  AppCubit({required this.auth}) : super(InitialState()) {
    emit(LoginStates());
  }

  final AuthServices auth;
  late final token;
  Future signIn(
    String email,
    String password,
  ) async {
    try {
      emit(LoadingStates());
      token = await auth.login(
        email: email,
        password: password,
      );
      emit(LoggedState(token));
    } catch (e) {
      emit(FailedStates(e.toString()));
    }
  }
}
