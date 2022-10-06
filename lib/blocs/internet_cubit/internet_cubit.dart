import 'dart:async';

import 'package:bloc_demo/blocs/internet_cubit/internet_cubit_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetCubit() : super(InternetCubitState.initial) {
    streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetCubitState.gained);
      } else {
        emit(InternetCubitState.lost);
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel(); 
    return super.close();
  }
}
