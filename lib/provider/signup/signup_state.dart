import 'package:equatable/equatable.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState extends Equatable {
  final SignupStatus signupStatus;

  factory SignupState.initial() {
    return const SignupState(
      signupStatus: SignupStatus.initial,
    );
  }
  const SignupState({required this.signupStatus});

  @override
  // TODO: implement props
  List<Object?> get props => [signupStatus];

  SignupState copyWith({
    SignupStatus? signupStatus,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }

  @override
  bool get stringify => true;
}
