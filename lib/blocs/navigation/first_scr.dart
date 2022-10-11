import 'package:bloc_demo/blocs/navigation/first_cubit.dart';
import 'package:bloc_demo/blocs/navigation/second_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  static const route = "/first_screen";
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("first screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<FirstCubit, int>(builder: (context, state) {
            return Text(state.toString());
          }),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<FirstCubit>(context).increment();
            },
            child: const Text("increse"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SecondScreen.route, arguments: {
                  "title":"My second Screen"
                });
              },
              child: const Text("go to second screen"))
        ],
      ),
    );
  }
}
