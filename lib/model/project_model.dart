class ProjectModel {
  int? id;
  String? title;
  String? description;
  String? body;
  String? logo;
  String? linkText;
  String? link;
  bool? isDeployed;

  ProjectModel(
      {this.id,
      this.title,
      this.description,
      this.body,
      this.logo,
      this.linkText,
      this.link,
      this.isDeployed});
}
