import 'package:bloc_demo/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_demo/blocs/internet_bloc/internet_state.dart';
import 'package:bloc_demo/blocs/internet_cubit/internet_cubit.dart';
import 'package:bloc_demo/blocs/internet_cubit/internet_cubit_state.dart';
import 'package:bloc_demo/blocs/login_bloc/login_bloc.dart';
import 'package:bloc_demo/blocs/navigation/first_cubit.dart';
import 'package:bloc_demo/blocs/navigation/first_scr.dart';
import 'package:bloc_demo/blocs/navigation/route.dart';
import 'package:bloc_demo/login_scr.dart';
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
      create: (context) => FirstCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        initialRoute: FirstScreen.route,
        
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


class MyHome1Page extends StatelessWidget {
  const MyHome1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cubit Demo")),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetCubitState>(
          listener:(context1, state) => {
            if(state  == InternetCubitState.gained){
              ScaffoldMessenger.of(context1).showSnackBar(
                const SnackBar(content: Text("internet connected"),backgroundColor: Colors.green,)
              )
            }
            else if(state == InternetCubitState.lost){
              ScaffoldMessenger.of(context1).showSnackBar(
                const SnackBar(content: Text("internet lost"),backgroundColor: Colors.red,)
              )
            }
          },
          builder: (context1, state) {
            if (state == InternetCubitState.gained) {
              return const Text("Connected");
            }
            else if(state == InternetCubitState.lost){
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
