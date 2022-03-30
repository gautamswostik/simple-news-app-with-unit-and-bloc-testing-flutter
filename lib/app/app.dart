import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/news/news_bloc.dart';
import 'package:news_app/infrastructure/news/news_api.dart';
import 'package:news_app/presentation/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NewsRepository newsRepository = NewsRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(newsRepository: newsRepository)..add(GetNewsEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
