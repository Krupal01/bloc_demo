import 'package:bloc_demo/blocs/navigation/second_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  final String title;
  static const route = "/second_screen";
  const SecondScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<SecondCubit, int>(
            builder: (context, state) {
              return Text(state.toString());
            },
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<SecondCubit>(context).increment();
              },
              child: const Text("increse"))
        ],
      ),
    );
  }
}
