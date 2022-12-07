// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';


class ProductsList{
  List<ProductsModel> products;
  ProductsList(this.products);

  factory ProductsList.fromJson(Map<String,dynamic> data){
    final dat = data as List;
    return ProductsList(dat.map((e) => ProductsModel.fromJson(e)).toList());
  }
}
class ProductsModel {
    ProductsModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating,
    });

    int? id; 
    String? title;
    double? price;
    String? description;
    String? category;
    String? image;
    Rating? rating;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    
}

class Rating {
    Rating({
        this.rate,
        this.count,
    });

    double? rate;
    int? count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}
