import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/infrastructure/news/news_api.dart';

void main() {
  group(
    'Testing News Api',
    () {
      test(
        'Should Return Right when Success',
        () async {
          NewsRepository newsRepository = NewsRepository();
          final news = await newsRepository.getNews();
          expect(news.isRight(), true);
        },
      );
    },
  );
}
