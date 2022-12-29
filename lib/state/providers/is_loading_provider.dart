import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instant_gram/state/auth/provider/auth_state_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.isLoading;
});
