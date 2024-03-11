

/// * The product identifier is an important concept and can have its own type.
typedef ProductID = String;

/// Class representing a product.
class Product {
  const Product({
    required this.id,
    required this.imageUrl,
    required this.imageSellerUrl,
    required this.title,
    required this.description,
    required this.isLiveAuction,
    required this.meta,
    required this.estimationPriceStart,
    required this.estimationPriceEnd
  });

  /// Unique product id
  final ProductID id;
  final String imageUrl;
  final String imageSellerUrl;
  final String title;
  final String description;
  final bool isLiveAuction;
  final List<String> meta;
  final double estimationPriceStart;
  final double estimationPriceEnd;


  @override
  String toString() {
    return 'Product(id: $id, imageUrl: $imageUrl,imageSellerUrl: $imageSellerUrl, title: $title, description: $description, '
        ' isLiveAuction: $isLiveAuction,  meta: $meta, estimationPriceStart: $estimationPriceStart, estimationPriceEnd: $estimationPriceEnd';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.imageUrl == imageUrl &&
        other.imageSellerUrl == imageSellerUrl &&
        other.title == title &&
        other.description == description &&
        other.isLiveAuction == isLiveAuction &&
        other.meta == meta &&
        other.estimationPriceStart == estimationPriceStart &&
        other.estimationPriceEnd == estimationPriceEnd;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    imageUrl.hashCode ^
    imageSellerUrl.hashCode ^
    title.hashCode ^
    description.hashCode ^
    isLiveAuction.hashCode ^
    estimationPriceStart.hashCode ^
    estimationPriceEnd.hashCode ^
    meta.hashCode;
  }

  Product copyWith({
    ProductID? id,
    String? imageUrl,
    String? imageSellerUrl,
    String? title,
    String? description,
    bool? isLiveAuction,
    List<String>? meta,
    double? estimationPriceStart,
    double? estimationPriceEnd
  }) {
    return Product(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      imageSellerUrl: imageSellerUrl ?? this.imageSellerUrl,
      title: title ?? this.title,
      description: description ?? this.description,
      isLiveAuction: isLiveAuction ?? this.isLiveAuction,
      meta: meta ?? this.meta,
      estimationPriceStart: estimationPriceStart ?? this.estimationPriceStart,
      estimationPriceEnd: estimationPriceEnd ?? this.estimationPriceEnd,
    );
  }
}