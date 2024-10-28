import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Post.dart';

class PostRepository {
  final http.Client client;

  PostRepository({required this.client});

  Future<Post> fetchPost() async {
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}