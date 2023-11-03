
import '../entity/category.dart';
import '../repository/categories_repository.dart';

class GetCategories {
  final CategoriesRepository categoriesRepository;
  GetCategories(this.categoriesRepository);
        Future<List<Category>> call() async {
    return await categoriesRepository.getFoodCategories();
  }
}
