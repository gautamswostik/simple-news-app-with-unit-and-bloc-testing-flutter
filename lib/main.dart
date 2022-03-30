import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/bloc_obsever.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
      BlocOverrides.current;
    },
    blocObserver: AppBlocObserver(),
  );
}
