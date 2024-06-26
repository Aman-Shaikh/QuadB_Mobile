// lib/models/partner.dart
class LeaderboardPartner {
  final String id;
  final String bannerImage;
  final String logo;
  final String socials;
  final int ordersPlaced;
  final int netItemsCount;
  final String partnerType;
  final User user;

  LeaderboardPartner({
    required this.id,
    required this.bannerImage,
    required this.logo,
    required this.socials,
    required this.ordersPlaced,
    required this.netItemsCount,
    required this.partnerType,
    required this.user,
  });

  factory LeaderboardPartner.fromJson(Map<String, dynamic> json) {
    return LeaderboardPartner(
      id: json['_id'],
      bannerImage: json['bannerImage'],
      logo: json['logo'],
      socials: json['socials'],
      ordersPlaced: json['ordersPlaced'],
      netItemsCount: json['netItemsCount'],
      partnerType: json['partnerType'],
      user: User.fromJson(json['userId']),
    );
  }
}

class User {
  final String id;
  final String address;
  final String name;
  final String email;

  User({
    required this.id,
    required this.address,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      address: json['address'],
      name: json['name'],
      email: json['email'],
    );
  }
}