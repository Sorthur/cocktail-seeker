// ignore_for_file: overridden_fields

import 'filter.dart';

class GlassFilter extends Filter {
  @override
  String name;

  GlassFilter({required this.name});

  factory GlassFilter.fromJson(Map<String, dynamic> json) {
    return GlassFilter(
      name: json['strGlass'],
    );
  }
}
