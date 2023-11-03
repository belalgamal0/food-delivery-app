abstract class FavoriteEvent{}
class AddFoodFavoriteEvent extends FavoriteEvent{
  final String foodName;
  final String boxName;
  AddFoodFavoriteEvent({required this.foodName,required this.boxName});
}
class CheckFavoriteFoodEvent extends FavoriteEvent{
  final String foodKey;
  final String boxName;
  CheckFavoriteFoodEvent({required this.foodKey,required this.boxName});
}
