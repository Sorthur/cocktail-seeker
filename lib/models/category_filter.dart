class CategoryFilter {
  String name;

  CategoryFilter({required this.name});

  factory CategoryFilter.fromJson(Map<String, dynamic> json) {
    return CategoryFilter(
      name: json['strCategory'],
    );
  }

  @override
  String toString() {
    return name;
  }
}
