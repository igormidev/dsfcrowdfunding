import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_post.freezed.dart';
part 'user_post.g.dart';

@freezed
class UserPost with _$UserPost {
  factory UserPost({
    required String id,
    required String title,
    required Uri thumb,
    required Uri video,
    required DateTime postedAt,
    required String? contentCategory,
    required int numLikes,
    required int numComments,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) =>
      _$UserPostFromJson(json);
}
