class PaketModels {
  final int id, price;
  final String title, description, termsAndConditions, startDate, dueDate;
  PaketModels({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.termsAndConditions,
    required this.startDate,
    required this.dueDate,
  });
  factory PaketModels.fromJson(Map<String, dynamic> json) {
    return PaketModels(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      termsAndConditions: json['terms_and_conditions'],
      startDate: json['start_date'],
      dueDate: json['due_date'],
    );
  }
}
