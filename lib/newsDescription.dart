import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_api/model/article.dart';
import 'package:news_api/widgets/newsCard.dart';

class NewsDescriptiion extends StatelessWidget {
  final Article article;
  const  NewsDescriptiion({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail News"),
      ),
      body: NewsCard(article:article),
    );
  }
}
