// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      source: json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('source', instance.source?.toJson());
  writeNotNull('author', instance.author);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('url', instance.url);
  writeNotNull('urlToImage', instance.urlToImage);
  writeNotNull('publishedAt', instance.publishedAt?.toIso8601String());
  writeNotNull('content', instance.content);
  return val;
}
