import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notes_app/services/remote/dio/dio_helper.dart';
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
        Fluttertoast.showToast(
            msg: "wrong password or email", backgroundColor: Colors.black45);
        emit(LoginErrorState());
      } else {
        CacheHelper.saveData(key: 'token', value: value.data.toString());
        emit(LoginSuccessfulState());
      }
    }).catchError((error) {
      Fluttertoast.showToast(
          msg: "sorry, an error has occurred", backgroundColor: Colors.black45);
      emit(LoginErrorState());
      print("error is: $error");
    });
  }

  void addUser(
      {required dynamic newUser}) {
    emit(AddUserLoadingState());
    DioHelper.postData(
        url: "user/",
        data: newUser).then((value) {
          print(value.data);
      //CacheHelper.saveData(key: 'token',value: value.data.toString());
      emit(AddUserSuccessfulState());
    }).catchError((error) {
      Fluttertoast.showToast(
      msg: "sorry, an error has occurred", backgroundColor: Colors.black45);
      emit(AddUserErrorState());
      print("error is: $error");
    });
  }
}