import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_reader_app/news_provider.dart';
import 'package:news_reader_app/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Reader App'), // Added const
      ),
      body: Consumer<NewsProvider>(
        builder: (context, newsProvider, child) {
          if (newsProvider.articles.isEmpty) {
            return const Center(
              // Added const
              child: CircularProgressIndicator(), // Added const
            );
          } else {
            return ListView.builder(
              itemCount: newsProvider.articles.length,
              itemBuilder: (context, index) {
                return NewsCard(article: newsProvider.articles[index]);
              },
            );
          }
        },
      ),
    );
  }
}
