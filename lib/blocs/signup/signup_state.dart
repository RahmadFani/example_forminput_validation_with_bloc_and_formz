part of 'signup_cubit.dart';

class SignupState extends Equatable {

  const SignupState({this.email});

  SignupState.init() : this(email: EmailInput.pure());

  final EmailInput email;

  SignupState copyWith(
    {EmailInput email}
  ) => SignupState(
    email: email ?? this.email
  );

  @override
  List<Object> get props => [email, email.loading];

}

