import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instant_gram/state/constants/firebase_collection_name.dart';
import 'package:instant_gram/state/constants/firebase_field_name.dart';
import 'package:instant_gram/state/posts/typedefs/user_id.dart';
import 'package:instant_gram/state/user_info/models/user_info_payload.dart';


import 'dart:developer' as devtools show log;
extension Log on Object {
void log() => devtools.log(toString());
}
@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) async {
    try {
      //first check if we have this user's info from before
      final userInfo = await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .where(
            FirebaseFieldName.userId,
            isEqualTo: userId,
          )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        //user already exists, update their info
        await userInfo.docs.first.reference.update(
          {
            FirebaseFieldName.displayName: displayName,
            FirebaseFieldName.email: email ?? '',
          },
        );
        return true;
      }

      //user doesn't exist, create a new one
      final payload = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
      );
      await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.users,
          )
          .add(
            payload,
          );
      return true;
    } catch (e) {
      e.log();
      return false;
    }
  }
}
