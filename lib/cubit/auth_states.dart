import 'package:equatable/equatable.dart';
import '../model/user_model.dart';

abstract class AuthStates extends Equatable {
  const AuthStates();
  @override
  List<Object> get props => [];
}

class InitialState extends AuthStates {}

class LoginState extends AuthStates {}

class LoadingState extends AuthStates {}

class LoggedState extends AuthStates {
  final UserModel auth;
  const LoggedState(this.auth);
  @override
  List<Object> get props => [auth];
}

class FailedState extends AuthStates {
  final String error;
  const FailedState(this.error);
  @override
  List<Object> get props => [error];
  
}
