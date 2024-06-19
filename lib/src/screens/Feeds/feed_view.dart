// views/feed_view.dart
import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../services/feed_controller.dart';
import 'post_widget.dart';

class FeedView extends StatelessWidget {
  final FeedController controller = FeedController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: controller.fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No posts available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return PostWidget(post: snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}