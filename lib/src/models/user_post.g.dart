// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPostImpl _$$UserPostImplFromJson(Map<String, dynamic> json) =>
    _$UserPostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      thumb: Uri.parse(json['thumb'] as String),
      video: Uri.parse(json['video'] as String),
      postedAt: DateTime.parse(json['postedAt'] as String),
      contentCategory: json['contentCategory'] as String?,
      numLikes: json['numLikes'] as int,
      numComments: json['numComments'] as int,
    );

Map<String, dynamic> _$$UserPostImplToJson(_$UserPostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumb': instance.thumb.toString(),
      'video': instance.video.toString(),
      'postedAt': instance.postedAt.toIso8601String(),
      'contentCategory': instance.contentCategory,
      'numLikes': instance.numLikes,
      'numComments': instance.numComments,
    };
