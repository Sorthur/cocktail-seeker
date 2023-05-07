// ignore_for_file: overridden_fields

import 'filter.dart';

class AlcoholicFilter extends Filter {
  @override
  String name;

  AlcoholicFilter({required this.name});

  factory AlcoholicFilter.fromJson(Map<String, dynamic> json) {
    return AlcoholicFilter(
      name: json['strAlcoholic'],
    );
  }
}
