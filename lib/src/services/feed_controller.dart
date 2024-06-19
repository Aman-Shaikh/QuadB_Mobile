// controllers/feed_controller.dart
import '../models/post_model.dart';

class FeedController {
  Future<List<Post>> fetchPosts() async {
    // Simulate fetching posts from an API or database
    await Future.delayed(Duration(seconds: 2)); // Simulated network delay
    return [
      Post(
        username: 'user1',
        imageUrl: 'https://via.placeholder.com/600/92c952',
        caption: 'Enjoying the view!',
      ),
      Post(
        username: 'user2',
        imageUrl: 'https://via.placeholder.com/600/771796',
        caption: 'Great day out!',
      ),
      Post(
        username: 'user3',
        imageUrl: 'https://via.placeholder.com/600/24f355',
        caption: 'Sunset by the beach.',
      ),
      Post(
        username: 'user4',
        imageUrl: 'https://via.placeholder.com/600/d32776',
        caption: 'City lights at night.',
      ),
      Post(
        username: 'user5',
        imageUrl: 'https://via.placeholder.com/600/f66b97',
        caption: 'Hiking adventures!',
      ),
    ];
  }
}