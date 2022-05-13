import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/services/local/shared_preferences/cache_helper.dart';
import 'package:notes_app/services/remote/dio/dio_helper.dart';
import 'package:notes_app/src/app_root.dart';
import 'bloc/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(
        () => runApp(const AppRoot()),
    blocObserver: MyBlocObserver(),
  );
}