class AlcoholicFilter {
  String alcoholic;

  AlcoholicFilter({required this.alcoholic});

  factory AlcoholicFilter.fromJson(Map<String, dynamic> json) {
    return AlcoholicFilter(
      alcoholic: json['strAlcoholic'],
    );
  }
}
