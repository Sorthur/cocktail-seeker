class ApiConstants {
  static String baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1';

  // Details
  static String cocktailEndpoint = '/lookup.php?i=';
  static String ingredientEndpoint = '/lookup.php?iid=';

  // List of filters
  static String categoryListEndpoint = '/list.php?c=list';
  static String glassListEndpoint = '/list.php?g=list';
  static String ingredientListEndpoint = '/list.php?i=list';
  static String alcoholicListEndpoint = '/list.php?a=list';

  // FilterBy
  static String cocktailByIngredientEndpoint = 'filter.php?i=';
  static String cocktailByAlcoholicEndpoint = 'filter.php?a=';
  static String cocktailByCategoryEndpoint = 'filter.php?c=';
  static String cocktailByGlassEndpoint = 'filter.php?g=';
}
