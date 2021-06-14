import 'package:bloc_sessions/bloc/auth_bloc.dart';
import 'package:bloc_sessions/models/auth_model.dart';
import 'package:bloc_sessions/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  AuthBloc authBloc;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return (authBloc = AuthBloc());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('auth'),
          centerTitle: true,
          titleSpacing: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthenticatedState)
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/profile', (route) => false);
            },
            builder: (context, state) {
              if (state is AuthInitial) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'username'),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'password'),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ElevatedButton(
                        onPressed: () {
                          authBloc.add(
                            LoginEvent(
                              authModel: AuthModel(
                                  email: usernameController.text,
                                  password: passwordController.text),
                            ),
                          );
                        },
                        child: Text('login'))
                  ],
                );
              } else if (state is AuthenticatingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'username'),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'password'),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    ElevatedButton(
                      onPressed: () {
                        authBloc.add(
                          LoginEvent(
                            authModel: AuthModel(
                                email: usernameController.text,
                                password: passwordController.text),
                          ),
                        );
                      },
                      child: Text('login'),
                    ),
                    Text(
                      '${state.message}',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                );
              } else
                return Text('something went wrong');
            },
          ),
        ),
      ),
    );
  }
}
