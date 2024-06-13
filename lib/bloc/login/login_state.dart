// part of 'login_bloc.dart';

import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure, errorr }

class LoginState extends Equatable {
  final LoginStatus status;
  final String message;
  final String email;
  final String password;
  const LoginState({
    this.email = '',
    this.password = '',
    this.message = '',
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? message,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, message, status];
}

final class LoginInitial extends LoginState {}
