import 'package:bloc_demo/blocs/login_bloc/login_bloc.dart';
import 'package:bloc_demo/blocs/login_bloc/login_event.dart';
import 'package:bloc_demo/blocs/login_bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginBlock>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Column(
          children: [
            BlocBuilder<LoginBlock, LoginState>(builder: (context, state) {
              if (state is LoginErrorState) {
                return Text(state.errorMsg);
              } else {
                return Container();
              }
            }),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(hintText: "User Name"),
              onChanged: (value) {
                loginBloc.add(LoginTextChangeEvent(
                    userNameController.text, passwordController.text));
              },
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (value) {
                loginBloc.add(LoginTextChangeEvent(
                    userNameController.text, passwordController.text));
              },
            ),
            BlocBuilder<LoginBlock, LoginState>(builder: ((context, state) {
              return ElevatedButton(
                onPressed: () {
                  loginBloc.add(LoginSubmittedEvent(
                      userNameController.text, passwordController.text));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      (state is LoginValidState) ? Colors.blue : Colors.grey),
                ),
                child: const Text("Login"),
              );
            })),
          ],
        ));
  }
}
