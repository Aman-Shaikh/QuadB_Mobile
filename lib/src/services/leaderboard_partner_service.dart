// lib/services/partner_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/leaderboard_partners.dart';


class LeaderboardPartnerService {
  final String baseUrl = 'https://quad-b-i82h.onrender.com';

  Future<List<LeaderboardPartner>> fetchLeaderboardPartners() async {
    final response = await http.get(Uri.parse('$baseUrl/partners'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<LeaderboardPartner> partners = body.map((dynamic item) => LeaderboardPartner.fromJson(item)).toList();
      return partners;
    } else {
      throw Exception('Failed to load partners');
    }
  }
}
