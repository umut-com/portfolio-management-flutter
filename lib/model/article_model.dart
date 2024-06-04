class ArticleModel {
  final int id;
   DateTime? dateTime;
  final String title;
  final String description;
  final String content;

  ArticleModel({
    required this.id,
     this.dateTime,
    required this.title,
    required this.description,
    required this.content,
  });
}
