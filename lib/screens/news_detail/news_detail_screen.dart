import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_colors.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_images.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_sized_box.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_strings.dart';
import 'package:flutter_demo_news_app/modules/models/article.dart';
import 'package:flutter_demo_news_app/utils/date_time_util.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;

  const NewsDetailScreen({
    required this.article,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    String imgUrl = article.urlToImage ?? AppImages.imageNotFound;

    return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.newsDetails),
          backgroundColor: AppColors.appBarBgColor,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Center(
                    child: Container(
                      height: mq.size.height * 0.25,
                      width: mq.size.width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            imgUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  (article.title ?? ""),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                AppSizedBox.heightBoxSmall,
                Text(
                  DateTimeUtils.convertDateTimeToString(
                    article.publishedAt ?? DateTime.now(),
                  ),
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                AppSizedBox.heightBoxMedium,
                Text(
                  (article.description ?? ""),
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                AppSizedBox.heightBoxSmall,
              ],
            ),
          ),
        ));
  }
}
