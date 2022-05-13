part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class LoginLoadingState extends UserState {}
class LoginSuccessfulState extends UserState {}
class LoginErrorState extends UserState {}
class AddUserLoadingState extends UserState {}
class AddUserSuccessfulState extends UserState {}
class AddUserErrorState extends UserState {}