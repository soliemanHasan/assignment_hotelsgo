import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String name;
  final dynamic starts;
  final dynamic price;
  final String currency;
  final String image;
  final dynamic reviewScore;
  final String review;
  final String address;

  const CategoryEntity({
    required this.name,
    required this.starts,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  @override
  List<Object?> get props =>
      [name, starts, price, currency, image, reviewScore, review, address];
}
