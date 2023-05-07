// ignore_for_file: overridden_fields

import 'filter.dart';

class CategoryFilter extends Filter {
  @override
  String name;

  CategoryFilter({required this.name});

  factory CategoryFilter.fromJson(Map<String, dynamic> json) {
    return CategoryFilter(
      name: json['strCategory'],
    );
  }
}
