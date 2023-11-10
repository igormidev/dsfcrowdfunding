// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPost _$UserPostFromJson(Map<String, dynamic> json) {
  return _UserPost.fromJson(json);
}

/// @nodoc
mixin _$UserPost {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Uri get thumb => throw _privateConstructorUsedError;
  Uri get video => throw _privateConstructorUsedError;
  DateTime get postedAt => throw _privateConstructorUsedError;
  String? get contentCategory => throw _privateConstructorUsedError;
  int get numLikes => throw _privateConstructorUsedError;
  int get numComments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPostCopyWith<UserPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPostCopyWith<$Res> {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) then) =
      _$UserPostCopyWithImpl<$Res, UserPost>;
  @useResult
  $Res call(
      {String id,
      String title,
      Uri thumb,
      Uri video,
      DateTime postedAt,
      String? contentCategory,
      int numLikes,
      int numComments});
}

/// @nodoc
class _$UserPostCopyWithImpl<$Res, $Val extends UserPost>
    implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumb = null,
    Object? video = null,
    Object? postedAt = null,
    Object? contentCategory = freezed,
    Object? numLikes = null,
    Object? numComments = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as Uri,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as Uri,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contentCategory: freezed == contentCategory
          ? _value.contentCategory
          : contentCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      numLikes: null == numLikes
          ? _value.numLikes
          : numLikes // ignore: cast_nullable_to_non_nullable
              as int,
      numComments: null == numComments
          ? _value.numComments
          : numComments // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPostImplCopyWith<$Res>
    implements $UserPostCopyWith<$Res> {
  factory _$$UserPostImplCopyWith(
          _$UserPostImpl value, $Res Function(_$UserPostImpl) then) =
      __$$UserPostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      Uri thumb,
      Uri video,
      DateTime postedAt,
      String? contentCategory,
      int numLikes,
      int numComments});
}

/// @nodoc
class __$$UserPostImplCopyWithImpl<$Res>
    extends _$UserPostCopyWithImpl<$Res, _$UserPostImpl>
    implements _$$UserPostImplCopyWith<$Res> {
  __$$UserPostImplCopyWithImpl(
      _$UserPostImpl _value, $Res Function(_$UserPostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumb = null,
    Object? video = null,
    Object? postedAt = null,
    Object? contentCategory = freezed,
    Object? numLikes = null,
    Object? numComments = null,
  }) {
    return _then(_$UserPostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as Uri,
      video: null == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as Uri,
      postedAt: null == postedAt
          ? _value.postedAt
          : postedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contentCategory: freezed == contentCategory
          ? _value.contentCategory
          : contentCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      numLikes: null == numLikes
          ? _value.numLikes
          : numLikes // ignore: cast_nullable_to_non_nullable
              as int,
      numComments: null == numComments
          ? _value.numComments
          : numComments // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPostImpl implements _UserPost {
  _$UserPostImpl(
      {required this.id,
      required this.title,
      required this.thumb,
      required this.video,
      required this.postedAt,
      required this.contentCategory,
      required this.numLikes,
      required this.numComments});

  factory _$UserPostImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPostImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final Uri thumb;
  @override
  final Uri video;
  @override
  final DateTime postedAt;
  @override
  final String? contentCategory;
  @override
  final int numLikes;
  @override
  final int numComments;

  @override
  String toString() {
    return 'UserPost(id: $id, title: $title, thumb: $thumb, video: $video, postedAt: $postedAt, contentCategory: $contentCategory, numLikes: $numLikes, numComments: $numComments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumb, thumb) || other.thumb == thumb) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.postedAt, postedAt) ||
                other.postedAt == postedAt) &&
            (identical(other.contentCategory, contentCategory) ||
                other.contentCategory == contentCategory) &&
            (identical(other.numLikes, numLikes) ||
                other.numLikes == numLikes) &&
            (identical(other.numComments, numComments) ||
                other.numComments == numComments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, thumb, video,
      postedAt, contentCategory, numLikes, numComments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPostImplCopyWith<_$UserPostImpl> get copyWith =>
      __$$UserPostImplCopyWithImpl<_$UserPostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPostImplToJson(
      this,
    );
  }
}

abstract class _UserPost implements UserPost {
  factory _UserPost(
      {required final String id,
      required final String title,
      required final Uri thumb,
      required final Uri video,
      required final DateTime postedAt,
      required final String? contentCategory,
      required final int numLikes,
      required final int numComments}) = _$UserPostImpl;

  factory _UserPost.fromJson(Map<String, dynamic> json) =
      _$UserPostImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  Uri get thumb;
  @override
  Uri get video;
  @override
  DateTime get postedAt;
  @override
  String? get contentCategory;
  @override
  int get numLikes;
  @override
  int get numComments;
  @override
  @JsonKey(ignore: true)
  _$$UserPostImplCopyWith<_$UserPostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
