import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instant_gram/state/auth/provider/auth_state_provider.dart';
import 'package:instant_gram/state/posts/typedefs/user_id.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
