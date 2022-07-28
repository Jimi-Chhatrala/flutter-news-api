import 'package:flutter/material.dart';
import 'package:news_api/model/article.dart';
import 'package:news_api/service/api_service.dart';
import 'package:news_api/widgets/newsCard.dart';
import 'package:news_api/newsDescription.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'News API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService apiService = ApiService();

  // int _counter = 0;

  // void _incrementCounter() {
  // setState(() {
  // _counter++;
  // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: apiService.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDescriptiion()));
                      },
                      child: NewsCard(article: snapshot.data![index]));
                  // return Card(
                  //   elevation: 15,
                  //   child: Column(children: [
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(10),
                  //       child:
                  //      Image.network('${snapshot.data![index].urlToImage}',fit: BoxFit.fill,height: 200,width: 300,),

                  //     )
                  //     ,SizedBox(height: 10,),
                  //     Text('${snapshot.data![index].title}',
                  //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  //     ),
                  //     SizedBox(height: 10,),
                  //      Text('${snapshot.data![index].description}'),

                  //   ],),
                  //   // ListTile(
                  //   //   title: Text('${snapshot.data![index].title}'),
                  //   //   subtitle:
                  //   //    Text('${snapshot.data![index].description}'),
                  //   //   leading:
                  //   //    Image.network('${snapshot.data![index].urlToImage}'),
                  //   // ),
                  // );
                  // Text('${snapshot.data![index].title}');
                });
            // return Text('Success');
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        // builder: (BuildContext context,AsyncSnapshot<List<Article>> snapshot),
      ),
    );
  }
}
