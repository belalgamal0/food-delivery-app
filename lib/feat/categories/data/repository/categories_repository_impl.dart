import '../../domain/entity/category.dart';
import '../../domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
   List<Category> categories = [
    const Category(id: 0, name: "pizza"),
    const Category(id: 1, name: "beef"),
    const Category(id: 2, name: "chicken"),
    const Category(id: 3, name: "salad"),
    const Category(id: 4, name: "cake"),
    const Category(id: 5, name: "fish"),
    const Category(id: 6, name: "donuts")
  ];
  Future<List<Category>> getFoodCategories() async {
    return categories;
  }
}