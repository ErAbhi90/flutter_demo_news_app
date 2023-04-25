import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_colors.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_strings.dart';
import 'package:flutter_demo_news_app/screens/news/news_vm.dart';
import 'package:flutter_demo_news_app/screens/news/widgets/news_list_card.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewsVM(),
      child: Consumer<NewsVM>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            key: vm.scaffoldKey,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              title: const Text(AppStrings.news),
              backgroundColor: AppColors.appBarBgColor,
            ),
            backgroundColor: AppColors.backgroundColor,
            body: ListView.builder(
              itemCount: vm.articles.length,
              itemBuilder: (_, index) {
                final article = vm.articles[index];
                return NewsListCard(article: article);
              },
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
