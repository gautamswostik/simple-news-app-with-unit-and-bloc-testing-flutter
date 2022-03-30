import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/infrastructure/core/failure.dart';
import 'package:news_app/infrastructure/news/entities/news_enties.dart';
import 'package:news_app/infrastructure/news/news_api.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  NewsBloc({required this.newsRepository}) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) {});
    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());
      final news = await newsRepository.getNews();

      news.fold(
        (l) => emit(NewsError(failure: l)),
        (r) => emit(NewsLoaded(news: r)),
      );
    });
  }
}
