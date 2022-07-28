class Article {
  String? title;
  String? description;
  String? urlToImage;

  Article({required this.title, required this.description, this.urlToImage});

  factory Article.fromJson(Map<String, dynamic>json){
    return Article(
        title: json["title"] == null ? null : json["title"],//as String,
        description: json["description"] == null ? null : json["description"], //as String,
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],//as String,
        // urlToImage: json["urlToImage"] as String,
    );
  }
}