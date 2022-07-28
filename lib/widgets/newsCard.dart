import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_api/model/article.dart';

class NewsCard extends StatelessWidget {
  final Article article;
  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              '${article.urlToImage}',
              fit: BoxFit.fill,
              height: 200,
              width: 300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${article.title}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text('${article.description}'),
        ],
      ),
    );
  }
}
