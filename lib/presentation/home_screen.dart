import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/news/news_bloc.dart';
import 'package:news_app/infrastructure/news/entities/news_enties.dart';
import 'package:news_app/presentation/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsError) {
            return Center(
              child: Text(state.failure.reason),
            );
          }
          if (state is NewsLoaded) {
            return NewsCard(
              articles: state.news.articles,
            );
          }
          return const SizedBox();
        },
        listener: (context, state) {},
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  const NewsCard({Key? key, required this.articles}) : super(key: key);
  final List<Articles> articles;
  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.articles.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  title: widget.articles[index].title,
                  image: widget.articles[index].urlToImage,
                  description: widget.articles[index].description,
                ),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                    tag: widget.articles[index].title,
                    child: Image.network(widget.articles[index].urlToImage),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.articles[index].description,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
