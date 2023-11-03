import '../entity/category.dart';

abstract class CategoriesRepository {
    Future<List<Category>> getFoodCategories();
}