abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  List<Object> get props => [message];
}

class ProfileLoading extends AuthState {}

class AuthSignedOut extends AuthState {}
