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