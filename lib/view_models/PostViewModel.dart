import 'package:flutter/material.dart';

import '../models/Post.dart';
import '../repositories/PostRepository.dart';


class PostViewModel extends ChangeNotifier {
  final PostRepository postRepository;
  Post? post;
  bool isLoading = false;

  PostViewModel({required this.postRepository});

  Future<void> fetchPost() async {
    isLoading = true;
    notifyListeners();

    try {
      post = await postRepository.fetchPost();
    } catch (e) {
      print('Error fetching post: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}