import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sessions/models/auth_model.dart';
import 'package:bloc_sessions/models/registered_user.dart';
import 'package:bloc_sessions/services/auth_service.dart';
import 'package:bloc_sessions/util/local_cred.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  AuthService authService = AuthService();

  StorageUtil storageUtil = StorageUtil.getInstance();
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield AuthenticatingState();
      try {
        RegisteredUser result = await authService.authUser(event.authModel);
        storageUtil.storeAuth(result);
        yield AuthenticatedState(registeredUser: result);
      } catch (e) {
        yield ErrorState(
            message: e.toString().substring(e.toString().indexOf(':') + 1));
      }
    }
  }
}
