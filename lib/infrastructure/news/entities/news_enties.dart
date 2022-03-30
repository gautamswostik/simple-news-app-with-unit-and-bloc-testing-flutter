import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_enties.freezed.dart';
part 'news_enties.g.dart';

@freezed
class News with _$News {
  const factory News({
    @Default('') String status,
    @Default(-1) num totalResults,
    @Default([]) List<Articles> articles,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}

@freezed
class Articles with _$Articles {
  const factory Articles({
    Source? source,
    @Default('') String author,
    @Default('') String title,
    @Default('') String description,
    @Default('') String url,
    @Default('') String urlToImage,
    @Default('') String publishedAt,
    @Default('') String content,
  }) = _Articles;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}

@freezed
class Source with _$Source {
  const factory Source({
    @Default('') String id,
    @Default('') String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
