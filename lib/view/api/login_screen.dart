import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/bloc/login/login_bloc.dart';
import 'package:learnbloc/bloc/login/login_event.dart';
import 'package:learnbloc/bloc/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.email != current.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: const InputDecoration(
                          hintText: 'Email', border: OutlineInputBorder()),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(EmailChanged(email: value));
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => previous.password != current.password,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.text,
                      focusNode: passwordFocusNode,
                      decoration: const InputDecoration(
                          hintText: 'Password', border: OutlineInputBorder()),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PasswordChanged(password: value));
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.status == LoginStatus.errorr) {
                      print(state.message.toString());
                    } else if (state.status == LoginStatus.loading) {
                      print(state.message.toString());
                    } else if (state.status == LoginStatus.success) {
                      print('SUCCESS');
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (current, previous) => false,
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(LoginEvent());
                              }
                            },
                            child: const Text('Login'));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
