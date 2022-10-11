import 'package:bloc_demo/blocs/navigation/first_cubit.dart';
import 'package:bloc_demo/blocs/navigation/first_scr.dart';
import 'package:bloc_demo/blocs/navigation/second_cubit.dart';
import 'package:bloc_demo/blocs/navigation/second_scr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static MaterialPageRoute? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case FirstScreen.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FirstCubit(),
            child: const FirstScreen(),
          ),
        );
      case SecondScreen.route:
        Map<String, dynamic> argu =
            routeSettings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SecondCubit(),
            child: SecondScreen(title:argu["title"],),
          ),
        );
      default:
        return null;
    }
  }
}
