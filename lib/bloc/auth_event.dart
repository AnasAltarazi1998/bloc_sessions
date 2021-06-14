part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  AuthModel authModel;

  LoginEvent({this.authModel});
}
