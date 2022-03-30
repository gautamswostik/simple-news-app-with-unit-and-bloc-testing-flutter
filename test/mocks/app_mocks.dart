import 'package:mockito/annotations.dart';
import 'package:news_app/application/news/news_bloc.dart';
import 'package:news_app/appsetup/dio/dio_client.dart';
import 'package:news_app/infrastructure/core/failure.dart';
import 'package:news_app/infrastructure/news/entities/news_enties.dart';
import 'package:news_app/infrastructure/news/news_api.dart';

@GenerateMocks([
  NewsRepository,
  DioClient,
  NewsBloc,
  News,
  Failure,
])
void main() {}
