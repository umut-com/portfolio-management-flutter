class ArticleRequestModel {
  String title;
  String description;
  String content;
  
  ArticleRequestModel({
    required this.title,
    required this.description,
    required this.content,
  });

  factory ArticleRequestModel.fromJson(Map<String, dynamic> json) =>
      ArticleRequestModel(
        title: json["title"],
        description: json["description"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "content": content,
      };
}
