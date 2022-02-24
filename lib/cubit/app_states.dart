import 'package:equatable/equatable.dart';
import 'package:sneaker/model/user_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoginStates extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingStates extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoggedState extends CubitStates {
  final UserModel auth;
  LoggedState(this.auth);
  @override
  List<Object> get props => [auth];
}

class FailedStates extends CubitStates {
  final String error;
  FailedStates(this.error);
  @override
  List<Object> get props => [error];
}
