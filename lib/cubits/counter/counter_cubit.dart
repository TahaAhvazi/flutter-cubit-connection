import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_connect/cubits/color/color_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void changeCounter(int incrementsize) {
    emit(state.copyWith(counter: state.counter + incrementsize));
  }
}
