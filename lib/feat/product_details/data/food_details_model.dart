class FoodDetailsModel {
    Recipe? recipe;

    FoodDetailsModel({
        this.recipe,
    });

    factory FoodDetailsModel.fromJson(Map<String, dynamic> json) => FoodDetailsModel(
        recipe: json["recipe"] == null ? null : Recipe.fromJson(json["recipe"]),
    );

    Map<String, dynamic> toJson() => {
        "recipe": recipe?.toJson(),
    };
}

class Recipe {
    String? publisher;
    List<String>? ingredients;
    String? sourceUrl;
    String? recipeId;
    String? imageUrl;
    int? socialRank;
    String? publisherUrl;
    String? title;

    Recipe({
        this.publisher,
        this.ingredients,
        this.sourceUrl,
        this.recipeId,
        this.imageUrl,
        this.socialRank,
        this.publisherUrl,
        this.title,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        publisher: json["publisher"],
        ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
        sourceUrl: json["source_url"],
        recipeId: json["recipe_id"],
        imageUrl: json["image_url"],
        socialRank: json["social_rank"],
        publisherUrl: json["publisher_url"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
        "source_url": sourceUrl,
        "recipe_id": recipeId,
        "image_url": imageUrl,
        "social_rank": socialRank,
        "publisher_url": publisherUrl,
        "title": title,
    };
}
