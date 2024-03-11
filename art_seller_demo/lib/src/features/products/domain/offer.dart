import 'package:art_seller_demo/src/features/products/domain/product.dart';

/// * The product identifier is an important concept and can have its own type.
typedef OfferID = String;

/// Class representing a product.
class Offer {
  const Offer({
    required this.id,
    required this.idProduct,
    required this.imageUrl,
    required this.name,
    required this.surname,
    required this.proposal,
    required this.time
  });

  /// Unique product id
  final OfferID id;
  final ProductID idProduct;
  final String imageUrl;
  final String name;
  final String surname;
  final double proposal;
  final DateTime time;

  @override
  String toString() {
    return 'Product(id: $id, idProduct: $idProduct, imageUrl: $imageUrl, title: $name, description: $surname, proposal: $proposal, time: $time';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Offer &&
        other.id == id &&
        other.idProduct == idProduct &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.surname == surname &&
        other.proposal == proposal &&
        other.time == time ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    idProduct.hashCode ^
    imageUrl.hashCode ^
    name.hashCode ^
    surname.hashCode ^
    proposal.hashCode ^
    time.hashCode;
  }

  Offer copyWith({
    OfferID? id,
    ProductID? idProduct,
    String? imageUrl,
    String? name,
    String? surname,
    double? proposal,
    DateTime? time,
    // double? price,
    // int? availableQuantity,
    // double? avgRating,
    // int? numRatings,
  }) {
    return Offer(
      id: id ?? this.id,
      idProduct: idProduct ?? this.idProduct,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      proposal: proposal ?? this.proposal,
      time: time ?? this.time,
    );
  }
}