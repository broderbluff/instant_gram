import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseCollectionName {
  static const String posts = 'posts';
  static const String users = 'users';
  static const String comments = 'comments';
  static const String likes = 'likes';
  static const String thumbnails = 'thumbnails';
  static const String images = 'images';
  static const String videos = 'videos';
  const FirebaseCollectionName._();
}
