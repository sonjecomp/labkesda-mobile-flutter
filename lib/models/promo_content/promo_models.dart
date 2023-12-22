class PromoModels {
  final String id, title, description, termsAndConditions, coverImage, startDate, dueDate;
  PromoModels({
    required this.id,
    required this.title,
    required this.description,
    required this.termsAndConditions,
    required this.startDate,
    required this.dueDate,
    required this.coverImage,
  });
  factory PromoModels.fromJson(Map<String, dynamic> json) {
    return PromoModels(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      termsAndConditions: json['terms_and_conditions'],
      startDate: json['start_date'],
      dueDate: json['due_date'],
      coverImage: json['cover_image'],
    );
  }
}
