// lib/controllers/leaderboard_partner_controller.dart
import 'package:flutter/material.dart';
import '../models/leaderboard_partners.dart';
import '../services/leaderboard_partner_service.dart';

class LeaderboardPartnerController with ChangeNotifier {
  final LeaderboardPartnerService _partnerService = LeaderboardPartnerService();
  List<LeaderboardPartner> _partners = [];
  bool _isLoading = true;

  List<LeaderboardPartner> get partners => _partners;
  bool get isLoading => _isLoading;

  LeaderboardPartnerController() {
    fetchPartners();
  }

  Future<void> fetchPartners() async {
    try {
      _partners = await _partnerService.fetchLeaderboardPartners();
      _sortPartnersByNetItemsCount();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _sortPartnersByNetItemsCount() {
    _partners.sort((a, b) => b.netItemsCount.compareTo(a.netItemsCount));
  }
}
