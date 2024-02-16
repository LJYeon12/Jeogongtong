import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:jeogongtong_front/provider/auth/auth_state.dart';
import 'package:jeogongtong_front/service/auth_service.dart';
import 'package:state_notifier/state_notifier.dart';

class AuthProvider extends StateNotifier<AuthState> with LocatorMixin {
  AuthProvider() : super(AuthState.unknown());

  @override
  void update(Locator watch) {
    final user = watch<fbAuth.User?>();
    if (user != null) {
      state = state.copyWith(authStatus: AuthStatus.authenticated, user: user);
    } else {
      state =
          state.copyWith(authStatus: AuthStatus.unauthenticated, user: user);
    }
    print('authState: $state');
    super.update(watch);
  }

  void signout() async {
    await read<AuthService>().signout();
  }
}
