part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, pasting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;
  const RegisterFormState({
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Password? password,
    Email? email,
  }) =>
      RegisterFormState(
        email: email ?? this.email,
        isValid: isValid ?? this.isValid,
        formStatus: formStatus ?? this.formStatus,
        password: password ?? this.password,
        username: username ?? this.username,
      );

  @override
  List<Object> get props => [formStatus, username, email, password, isValid];
}
