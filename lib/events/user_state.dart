import 'package:creole/models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the states
abstract class UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState(this.users);
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState(this.errorMessage);
}
