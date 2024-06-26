// post_model.dart

class Partner {
  final String id;
  final String bannerImage;
  final String? shortDescription;
  final String description;
  final List<String> tags;
  final String? socials;
  final int ordersPlaced;
  final int netItemsCount;
  final String partnerType;
  final User userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Partner({
    required this.id,
    required this.bannerImage,
    this.shortDescription,
    required this.description,
    required this.tags,
    this.socials,
    required this.ordersPlaced,
    required this.netItemsCount,
    required this.partnerType,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Partner.fromJson(Map<String, dynamic> json) {
    return Partner(
      id: json['_id'] ?? '',
      bannerImage: json['bannerImage'] ?? '',
      shortDescription: json['short_description'],
      description: json['description'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      socials: json['socials'],
      ordersPlaced: json['ordersPlaced'] ?? 0,
      netItemsCount: json['netItemsCount'] ?? 0,
      partnerType: json['partnerType'] ?? '',
      userId: User.fromJson(json['userId'] ?? {}),
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
    );
  }
}

class User {
  final String id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Post {
  final String id;
  final Partner partner;
  final String title;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  Post({
    required this.id,
    required this.partner,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] ?? '',
      partner: Partner.fromJson(json['partnerId'] ?? {}),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
    );
  }
}
