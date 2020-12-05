import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:news_app/src/models/category_model.dart';

import 'package:news_app/src/models/news_models.dart';

const _BASE_URL = 'http://newsapi.org/v2';
const _API_KEY = '';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entretaiment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  String _selectedCategory = 'business';

  NewsService() {
    this.getTopHeadlines();
    categories.forEach((Category element) {
      this.categoryArticles[element.name] = [];
    });
  }

  String get selectedCategory => this._selectedCategory;

  set selectedCategory(String value) {
    this._selectedCategory = value;
    this.getNewsByCategory(value);
    notifyListeners();
  }

  List<Article> get articlesSelectedCategory =>
      this.categoryArticles[_selectedCategory]!;

  getTopHeadlines() async {
    final url = '$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=us';
    final response = await http.get(url);
    final newsResponse = newsResponseFromJson(response.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getNewsByCategory(String category) async {
    if (this.categoryArticles[category]!.isNotEmpty) {
      return this.categoryArticles[category]!;
    }
    final url =
        '$_BASE_URL/top-headlines?apiKey=$_API_KEY&country=us&category=$category';
    final response = await http.get(url);
    final newsResponse = newsResponseFromJson(response.body);
    this.categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }
}
