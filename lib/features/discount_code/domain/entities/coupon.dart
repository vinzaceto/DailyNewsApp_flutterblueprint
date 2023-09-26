import 'package:equatable/equatable.dart';

class CouponEntity extends Equatable {
  final int? id;
  final String? name;
  final String? category;
  final String? description;
  final String? code;
  final String? urlToImage;
  final int? rating;

  const CouponEntity(
      {this.id, this.name, this.code, this.description, this.category, this.urlToImage, this.rating});

  @override
  List < Object ? > get props {
    return [
      id,
      name,
      code,
      description,
      category,
      urlToImage,
      rating
    ];
  }
}
