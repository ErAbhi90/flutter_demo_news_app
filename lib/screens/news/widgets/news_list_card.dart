import 'package:flutter/material.dart';
import 'package:flutter_demo_news_app/app_settings/resources/app_images.dart';
import 'package:flutter_demo_news_app/app_settings/router/app_router.dart';
import 'package:flutter_demo_news_app/modules/models/article.dart';

class NewsListCard extends StatelessWidget {
  const NewsListCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    String imgUrl = article.urlToImage ?? AppImages.imageNotFound;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 2,
        child: InkWell(
          onTap: () {
            AppRouter.navigateToNewsDetails(context, article);
          },
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    article.title ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.content ?? "",
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
