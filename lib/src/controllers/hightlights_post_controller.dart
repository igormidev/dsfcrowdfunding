import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dsfcrowdfunding/src/models/user_post.dart';
import 'package:dsfcrowdfunding/src/services/highlights_post_service.dart';

class HightlightsPostController extends ChangeNotifier {
  List<UserPost>? userPosts;
  final HighlightsPostService _service = HighlightsPostService();

  Future<void> getHighlightsPosts(String? userId) async {
    if (userId == null) throw Exception('User id is null');
    try {
      final response = await _service.getPosts(userId);
      userPosts = response;
    } catch (error, stack) {
      log(error.toString(), stackTrace: stack);
      rethrow;
    }
    notifyListeners();
  }
}
