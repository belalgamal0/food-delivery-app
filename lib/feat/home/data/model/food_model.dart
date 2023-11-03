import '../../domain/entity/food.dart';
import 'recipe_model.dart';
class FoodModel {
    int? count;
    List<Recipe>? recipes;

    FoodModel({
        this.count,
        this.recipes,
    });

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        count: json["count"],
        recipes: json["recipes"] == null ? [] : List<Recipe>.from(json["recipes"]!.map((x) => Recipe.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "recipes": recipes == null ? [] : List<dynamic>.from(recipes!.map((x) => x.toJson())),
    };
}

class Recipe {
    String? publisher;
    String? title;
    String? sourceUrl;
    String? recipeId;
    String? imageUrl;
    double? socialRank;
    String? publisherUrl;

    Recipe({
        this.publisher,
        this.title,
        this.sourceUrl,
        this.recipeId,
        this.imageUrl,
        this.socialRank,
        this.publisherUrl,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        publisher: json["publisher"],
        title: json["title"],
        sourceUrl: json["source_url"],
        recipeId: json["recipe_id"],
        imageUrl: json["image_url"],
        socialRank: json["social_rank"]?.toDouble(),
        publisherUrl: json["publisher_url"],
    );

    Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "title": title,
        "source_url": sourceUrl,
        "recipe_id": recipeId,
        "image_url": imageUrl,
        "social_rank": socialRank,
        "publisher_url": publisherUrl,
    };
}

// class FoodModel extends Food {
//   const FoodModel({
//     required int count,
//     required List<Recipe> recipes,
//   }) : super(count: count, recipes: recipes);

//   factory FoodModel.fromJson(Map<String, dynamic> json) =>
//       FoodModel(count: json["count"], recipes: json["recipes"]);

//   Map<String, dynamic> toJson() => {"count": count, "recipes": recipes};
// }
