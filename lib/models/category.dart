class Category {
  String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['strCategory'],
    );
  }

  @override
  String toString() {
    return name;
  }
}
