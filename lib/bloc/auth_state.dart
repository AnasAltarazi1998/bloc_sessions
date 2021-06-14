part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ErrorState extends AuthState {
  String message;
  ErrorState({this.message});
}

class AuthenticatedState extends AuthState {
  RegisteredUser registeredUser;

  AuthenticatedState({this.registeredUser});
}

class AuthenticatingState extends AuthState {}
