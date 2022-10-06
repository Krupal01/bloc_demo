import 'package:bloc_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_demo/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Demo"),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener:(context, state) => {
            if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("internet connected"),backgroundColor: Colors.green,)
              )
            }
            else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("internet lost"),backgroundColor: Colors.red,)
              )
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            }
            else if(state is InternetLostState){
              return const Text("lost connection");
            }else{
              return const Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
