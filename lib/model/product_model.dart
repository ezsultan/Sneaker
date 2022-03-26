import 'package:equatable/equatable.dart';
import 'category_model.dart';
import 'gallery_model.dart';

class ProductModel extends Equatable {
   int? id;
   String? name;
   double? price;
   String? description;
   CategoryModel? category;
   List<GalleryModel>? gallery;

   ProductModel({
     this.id,
     this.name,
     this.price,
     this.description,
    this.category,
   this.gallery,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: CategoryModel.fromJson(json["category"]),
        gallery: json['galleries']
            .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
            .toList(),
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "description": description,
      "category": category!.toJson(),
      "galleries": gallery!.map((gallery) => gallery.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        description,
        category,
        gallery,
      ];
}
