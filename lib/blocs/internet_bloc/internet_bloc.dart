import 'dart:async';

import 'package:bloc_demo/blocs/internet_bloc/internet_event.dart';
import 'package:bloc_demo/blocs/internet_bloc/internet_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLoss>(
      (event, emit) => emit(InternetLostState()),
    );

    on<InternetGained>(
      (event, emit) => emit(InternetGainedState()),
    );

    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGained());
      } else {
        add(InternetLoss());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
