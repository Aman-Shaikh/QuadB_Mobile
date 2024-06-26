// lib/views/leaderboard_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/leaderboard_partner_controller.dart';
import '../../models/leaderboard_partners.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LeaderboardPartnerController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard'),
        ),
        body: Consumer<LeaderboardPartnerController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: controller.partners.length,
              itemBuilder: (context, index) {
                final partner = controller.partners[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: partner.logo.startsWith('data:image')
                          ? MemoryImage(base64Decode(partner.logo.split(',')[1]))
                          : NetworkImage(partner.logo) as ImageProvider,
                    ),
                    title: Text(partner.user.name),
                    subtitle: Text(partner.user.address),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Orders: ${partner.ordersPlaced}'),
                        Text('Items: ${partner.netItemsCount}'),
                      ],
                    ),
                    onTap: () {
                      _showLeaderboardPartnerDetails(context, partner);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _showLeaderboardPartnerDetails(BuildContext context, LeaderboardPartner partner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(partner.user.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(partner.bannerImage),
              SizedBox(height: 10),
              Text('Type: ${partner.partnerType}'),
              SizedBox(height: 10),
              Text('Address: ${partner.user.address}'),
              SizedBox(height: 10),
              Text('Email: ${partner.user.email}'),
              SizedBox(height: 10),
              Text('Orders Placed: ${partner.ordersPlaced}'),
              SizedBox(height: 10),
              Text('Net Items Count: ${partner.netItemsCount}'),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Visit Website'),
              onPressed: () {
                // Handle navigation to website
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
