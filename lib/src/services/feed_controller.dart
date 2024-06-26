// post_controller.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';


class PostController {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://quad-b-i82h.onrender.com/posts/?partnerId=660a1c800f03cd2f27e44c7e'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((post) => Post.fromJson(post)).toList();
      } catch (e) {
        throw Exception('Failed to parse posts: $e');
      }
    } else {
      throw Exception('Failed to load posts: ${response.reasonPhrase}');
    }
  }
}
