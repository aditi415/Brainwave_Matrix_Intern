import 'package:flutter/material.dart';
import '../article_model.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the article's image
          if (article.urlToImage.isNotEmpty)
            Image.network(
              article.urlToImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          else
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
              child: const Center(
                child: Text(
                  'No Image Available',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          // Display the article's title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Display the article's description
          if (article.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                article.description,
                style: const TextStyle(fontSize: 14.0, color: Colors.black54),
              ),
            ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
