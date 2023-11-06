import 'package:injectable/injectable.dart';

import '../../../../core/api_provider/api_provider.dart';
import '../../../../core/api_provider/utils.dart';
import '../../../../core/failure/exception.dart';
import '../model/food_model.dart';
import 'package:dio/dio.dart';

abstract class FoodRemoteDataSource {
  Future<FoodModel> getfoods(String category);
}
@Injectable(as: FoodRemoteDataSource)
class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final Dio client;

  const FoodRemoteDataSourceImpl({required this.client});
  @override
  Future<FoodModel> getfoods(String category) => _getFoodFromUrl(category);
  Future<FoodModel> _getFoodFromUrl(String category) async {
    final response = await client.get(
        '${Utils.getFoodAuthority}${Utils.searchByCategory}$category',
        options: Options(headers: ApiProvider.requestHeader));
    if (response.statusCode == 200) {
      FoodModel foodListModels = FoodModel.fromJson(response.data);
      return foodListModels;
    } else {
      throw ServerException();
    }
  }
}
