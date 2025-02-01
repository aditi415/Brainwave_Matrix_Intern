import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?category=technology&apiKey=6d8b700039c04ece80d3a16ba7f0c18f';
  static const String _apiKey = '6d8b700039c04ece80d3a16ba7f0c18f';

  Future<List<Article>> fetchNews(String category) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/top-headlines?category=$category&apiKey=$_apiKey'),
      );

      log('API Response Status: ${response.statusCode}'); // Updated
      log('API Response Body: ${response.body}'); // Updated

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['articles'] as List)
            .map((json) => Article.fromJson(json))
            .toList();
      } else {
        throw Exception(
            'Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in fetchNews: $e', level: 1000); // Updated
      throw Exception('Failed to load news');
    }
  }
}
