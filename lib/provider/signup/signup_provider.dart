import 'package:jeogongtong_front/provider/signup/signup_state.dart';
import 'package:jeogongtong_front/service/auth_service.dart';
import 'package:state_notifier/state_notifier.dart';

class SignupProvider extends StateNotifier<SignupState> with LocatorMixin {
  SignupProvider() : super(SignupState.initial());

  Future<void> signInWithGoogle() async {
    state = state.copyWith(signupStatus: SignupStatus.submitting);
    try {
      await read<AuthService>().signInWithGoogle();
      state = state.copyWith(signupStatus: SignupStatus.beforeNickname);
    } catch (e) {
      state = state.copyWith(signupStatus: SignupStatus.error);
      rethrow;
    }
  }

  Future<void> nicknameSignUp(
      {required String token, required String nickname}) async {
    try {
      await read<AuthService>().signUp(nickname: nickname, token: token);
      state = state.copyWith(signupStatus: SignupStatus.success);
    } catch (e) {
      state = state.copyWith(signupStatus: SignupStatus.error);
      rethrow;
    }
  }
}
