import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  static const allowLikesTitle = 'Allow Likes';
  static const allowLikesDescription = 'Allow other users to like your posts';
  static const allowCommentsTitle = 'Allow Comments';
  static const allowCommentsDescription =
      'Allow other users to comment on your posts';
  static const allowLikesStorageKey = 'allow_likes';
  static const allowCommentsStorageKey = 'allow_comments';

  static const comment = 'comment';
  static const loading = 'Loading...';
  static const person = 'person';
  static const people = 'people';
  static const likedThis = 'liked this';

static const delete = 'Delete';
static const areYouSureYouWantToDeleteThis = 'Are you sure you want to delete this';
static const logOut = 'Log Out';
static const cancel = 'Cancel';
static const areYouSureThatYouWantToLogOut = 'Are you sure that you want to log out?';

  const Strings._();
}
