class RepositoryModel {
  final String title;
  final String description;

  RepositoryModel(this.title, this.description);

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      json['name'],
      json['description'],
    );
  }
}
