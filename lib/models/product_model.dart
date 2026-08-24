class ProductModel {
  final String? status;
  final Meta? meta;
  final List<Data>? data;

  ProductModel({this.status, this.meta, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      status: json['status'] as String?,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? (json['data'] as List)
              .map((i) => Data.fromJson(i as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
}

class Meta {
  final String? title;
  final String? description;
  final String? copyright;
  final String? generatedAt;
  final int? count;

  Meta({
    this.title,
    this.description,
    this.copyright,
    this.generatedAt,
    this.count,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      title: json['title'] as String?,
      description: json['description'] as String?,
      copyright: json['copyright'] as String?,
      generatedAt: json['generated_at'] as String?,
      count: json['count'] as int?,
    );
  }
}

class Data {
  final int? id;
  final String? name;
  final String? tagline;
  final String? description;
  final String? image;
  final String? price;
  final Map<String, dynamic>? specs;

  Data({
    this.id,
    this.name,
    this.tagline,
    this.description,
    this.image,
    this.price,
    this.specs,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      name: json['name'] as String?,
      tagline: json['tagline'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      specs: json['specs'] != null
          ? Map<String, dynamic>.from(json['specs'] as Map)
          : null,
    );
  }
}
