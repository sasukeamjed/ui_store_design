import 'package:ui_store_design/models/user_model.dart';

class AuthState{
  const AuthState();
}

class AuthInitial extends AuthState{
  const AuthInitial();
}

class AuthLoading extends AuthState{
  const AuthLoading();
}

class AuthLoaded extends AuthState{
  final UserModel userModel;
  const AuthLoaded(this.userModel);
}

class AuthError extends AuthState{
  final String message;
  const AuthError(this.message);
}