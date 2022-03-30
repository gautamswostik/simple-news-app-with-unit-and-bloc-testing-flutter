import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/application/news/news_bloc.dart';
import 'package:news_app/infrastructure/core/failure.dart';
import 'package:news_app/infrastructure/news/entities/news_enties.dart';
import 'package:news_app/infrastructure/news/news_api.dart';

import '../mocks/app_mocks.mocks.dart';

void main() {
  group('Testing NewsBloc', () {
    late NewsBloc newsBloc;
    late NewsRepository mockNewsRepository;
    late News mockNews;
    late Failure mockFailure;
    setUp(() {
      mockNewsRepository = MockNewsRepository();
      newsBloc = NewsBloc(newsRepository: mockNewsRepository);
      mockNews = MockNews();
      mockFailure = MockFailure();
    });

    test(
      'The NewsBloc should return NewsInitial as initial state',
      () {
        expect(newsBloc.state, isA<NewsInitial>());
      },
    );

    blocTest<NewsBloc, NewsState>(
        'When GetNewsEvent is called it should emit [NewsLoading , NewsLoaded]',
        setUp: () {
          when(mockNewsRepository.getNews())
              .thenAnswer((_) async => Right(mockNews));
        },
        build: () => NewsBloc(newsRepository: mockNewsRepository),
        act: (bloc) => bloc.add(GetNewsEvent()),
        expect: () => [
              isA<NewsLoading>(),
              isA<NewsLoaded>(),
            ],
        verify: (bloc) {
          mockNewsRepository.getNews();
        });
    blocTest<NewsBloc, NewsState>(
        'When GetNewsEvent is called it should emit [NewsLoading , NewsError]',
        setUp: () {
          when(mockNewsRepository.getNews())
              .thenAnswer((_) async => Left(mockFailure));
        },
        build: () => NewsBloc(newsRepository: mockNewsRepository),
        act: (bloc) => bloc.add(GetNewsEvent()),
        expect: () => [
              isA<NewsLoading>(),
              isA<NewsError>(),
            ],
        verify: (bloc) {
          mockNewsRepository.getNews();
        });
    tearDown(() {
      newsBloc.close();
    });
  });
}
