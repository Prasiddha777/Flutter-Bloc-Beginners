import 'package:bloc/bloc.dart';
import 'package:learnbloc/bloc/login/login_event.dart';
import 'package:learnbloc/bloc/login/login_state.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);

    on<LoginEvent>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      status: LoginStatus.loading,
      // message: 'Login Successful',
    ));
    Map data = {
      'email': state.email,
      'password': state.password,
    };
    try {
      final response = await http.post(Uri.parse('https://reqres.in/api/login'));
      if (response.statusCode == 200) {
        emit(state.copyWith(
          status: LoginStatus.success,
          message: 'Login Successful',
        ));
      } else {
        print(response.statusCode);
        emit(state.copyWith(
          status: LoginStatus.errorr,
          message: 'Unable to login',
        ));
      }
      // emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
