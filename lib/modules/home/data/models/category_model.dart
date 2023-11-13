import 'package:base_project_v2/modules/home/domin/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel(
      {required super.name,
      required super.starts,
      required super.price,
      required super.currency,
      required super.image,
      required super.reviewScore,
      required super.review,
      required super.address});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json["name"],
      starts: json["starts"],
      price: json["price"],
      currency: json["currency"],
      image: json["image"],
      reviewScore: json["review_score"],
      review: json["review"],
      address: json["address"],
    );
  }
}
