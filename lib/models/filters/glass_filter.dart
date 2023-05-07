class GlassFilter {
  String name;

  GlassFilter({required this.name});

  factory GlassFilter.fromJson(Map<String, dynamic> json) {
    return GlassFilter(
      name: json['strGlass'],
    );
  }
}