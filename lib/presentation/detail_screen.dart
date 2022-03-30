import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);
  final String title;
  final String image;
  final String description;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Hero(
                tag: widget.title,
                child: Image.network(widget.image),
              ),
              const SizedBox(
                height: 10,
              ),
              SelectableText(widget.description)
            ],
          ),
        ),
      ),
    );
  }
}
