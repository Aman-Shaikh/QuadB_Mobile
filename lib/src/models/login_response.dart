// lib/models/login_response.dart
class LoginResponse {
  final String message;
  final String id;
  final bool isPartner;
  final String partnerId;

  LoginResponse({
    required this.message,
    required this.id,
    required this.isPartner,
    required this.partnerId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      id: json['_id'],
      isPartner: json['isPartner'],
      partnerId: json['partnerId'],
    );
  }
}
