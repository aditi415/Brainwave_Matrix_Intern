import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:news_reader_app/api_service.dart';
import 'package:news_reader_app/article_model.dart';

class NewsProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  Future<void> fetchNews(String category) async {
    try {
      List<Article> fetchedArticles = await _apiService.fetchNews(category);
      _articles = List<Article>.from(fetchedArticles); // Ensures correct type
      notifyListeners();
    } catch (e, stackTrace) {
      log('Error in NewsProvider: $e', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
}
