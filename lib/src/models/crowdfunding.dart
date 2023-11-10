// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CrowdFunding {
  final String name;
  final String description;
  final int totalValue;
  final int currentValue;
  final ProductDetail productDetail;
  final CrowdFundingOwner crowdFundingOwner;
  const CrowdFunding({
    required this.name,
    required this.description,
    required this.totalValue,
    required this.currentValue,
    required this.productDetail,
    required this.crowdFundingOwner,
  });

  factory CrowdFunding.fromJson(String source) =>
      CrowdFunding.fromMap(json.decode(source) as Map<String, dynamic>);
  factory CrowdFunding.fromMap(Map<String, dynamic> map) {
    return CrowdFunding(
      name: map['name'] as String,
      description: map['description'] as String,
      totalValue: map['totalValue'] as int,
      currentValue: map['currentValue'] as int,
      productDetail:
          ProductDetail.fromMap(map['productDetail'] as Map<String, dynamic>),
      crowdFundingOwner: CrowdFundingOwner.fromMap(
          map['crowdFundingOwner'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'CrowdFunding(name: $name, description: $description, totalValue: $totalValue, currentValue: $currentValue, productDetail: $productDetail, crowdFundingOwner: $crowdFundingOwner)';
  }
}

class ProductDetail {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final int size;
  const ProductDetail({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.size,
  });

  factory ProductDetail.fromMap(Map<String, dynamic> map) {
    return ProductDetail(
      imageUrl: map['imageUrl'] as String,
      productName: map['name'] as String,
      productDescription: map['description'] as String,
      size: map['size'] as int,
    );
  }

  factory ProductDetail.fromJson(String source) =>
      ProductDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetail(imageUrl: $imageUrl, productName: $productName, productDescription: $productDescription, size: $size)';
  }
}

class CrowdFundingOwner {
  final String name;
  final String imageUrl;
  const CrowdFundingOwner({
    required this.name,
    required this.imageUrl,
  });

  factory CrowdFundingOwner.fromMap(Map<String, dynamic> map) {
    return CrowdFundingOwner(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory CrowdFundingOwner.fromJson(String source) =>
      CrowdFundingOwner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CrowdFundingOwner(name: $name, imageUrl: $imageUrl)';
}
