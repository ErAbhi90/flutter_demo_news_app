import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/modules/managers/data_manager.dart';
import 'package:flutter_demo_news_app/modules/managers/log_manager.dart';
import 'package:flutter_demo_news_app/modules/models/article.dart';
import 'package:get_it/get_it.dart';

class NewsVM with ChangeNotifier {
  NewsVM() {
    initData();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final logManager = GetIt.I<LogManager>();
  final dataManager = GetIt.I<DataManager>();

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void initData() async {
    _isLoading = true;
    notifyListeners();
    _articles = await dataManager.getArticles();
    _isLoading = false;
    notifyListeners();
  }
}
