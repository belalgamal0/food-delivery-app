import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/api_provider/api_provider.dart';
import '../../../../core/api_provider/utils.dart';
import '../../../../core/failure/exception.dart';
import '../food_details_model.dart';
import 'package:http/http.dart' as http;
abstract class DetailsRemoteDataSource {
    Future<FoodDetailsModel> getfoodDetails(String id);
}
class DetailsRemoteDataSourceImpl implements DetailsRemoteDataSource{
    final http.Client client;
  const DetailsRemoteDataSourceImpl({required this.client});
  @override
  Future<FoodDetailsModel> getfoodDetails(String id) =>
      _getDetailsFromUrl(id);
  Future<FoodDetailsModel> _getDetailsFromUrl(String id) async {
    final Dio _dio = Dio();
    final response = await _dio.get("https://forkify-api.herokuapp.com/api/get?rId=$id", options: Options(
                validateStatus: (status) {
                  return status! < 500;
                },
                headers: {
                  'Content-type': 'application/json',
                  'Accept': 'application/json',
                },
              ));
log(response.statusCode.toString());
    if (response.statusCode == 200) {
      // List jsonResponse = json.decode(response.body);
      FoodDetailsModel foodDetailsModel = FoodDetailsModel.fromJson(response.data);
      return foodDetailsModel;
    } else {
      throw ServerException();
    }
  }
}