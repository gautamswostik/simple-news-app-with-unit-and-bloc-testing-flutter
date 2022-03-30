import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/appsetup/constants/app_constants.dart';
import 'package:news_app/appsetup/dio/dio_client.dart';
import 'package:news_app/infrastructure/core/failure.dart';
import 'package:news_app/infrastructure/core/news_endpoints.dart';
import 'package:news_app/infrastructure/news/entities/news_enties.dart';

abstract class INewsRepositiry {
  Future<Either<Failure, News>> getNews();
}

class NewsRepository extends INewsRepositiry {
  Dio get _dio => DioClient().dioClient();
  @override
  Future<Either<Failure, News>> getNews() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        NewsEndpoint.topHeadlines,
        queryParameters: {
          'q': 'entertainment',
          'apiKey': ApiKey.apiKey,
        },
      );
      log('$response');
      final json = Map<String, dynamic>.from(response.data!);
      final data = News.fromJson(json);
      return Right(data);
    } on DioError catch (e) {
      log('$e');
      return Left(e.toFailure);
    } catch (e) {
      log('$e');
      return Left(Failure.fromException(e));
    }
  }
}
