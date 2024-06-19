// views/post_widget.dart
import 'package:flutter/material.dart';

import '../../models/post_model.dart';


class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.imageUrl),
          ),
          title: Text(post.username),
          trailing: Icon(Icons.more_vert),
        ),
        Image.network(
          post.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.comment),
              SizedBox(width: 16),
              Icon(Icons.send),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            post.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(post.caption),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}