import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/services/remote/dio/dio_helper.dart';
import '../../components/toast_message.dart';
import '../../services/local/shared_preferences/cache_helper.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  void login({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: "user/login",
        data: {"email": email, "password": password}).then((value) {
      print(value.data);
      if (value.data == "wrong password") {
        showToastMessage("wrong password or email");
        emit(LoginErrorState());
      } else {
        CacheHelper.saveData(key: 'token', value: value.data.toString());
        emit(LoginSuccessfulState());
      }
    }).catchError((error) {
      showToastMessage("sorry, an error has occurred");
      emit(LoginErrorState());
      print("error is: $error");
    });
  }

  void addUser({required dynamic newUser}) {
    emit(AddUserLoadingState());
    DioHelper.postData(url: "user/", data: newUser).then((value) {
      print(value.data);
      showToastMessage("Your account added successfully");
      emit(AddUserSuccessfulState());
    }).catchError((error) {
      showToastMessage("sorry, an error has occurred");
      emit(AddUserErrorState());
      print("error is: $error");
    });
  }
}
