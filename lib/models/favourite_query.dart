import 'filters/filter.dart';

class FavouriteQuery {
  late String id;
  String? filterType;
  String? filterName;
  Filter? filter;

  FavouriteQuery({
    required this.id,
    this.filterType,
    this.filterName,
    this.filter,
  });

  @override
  String toString() {
    return '$id | $filterType | $filterName | filter: ${filter?.name} ${filter.runtimeType}';
  }
}
