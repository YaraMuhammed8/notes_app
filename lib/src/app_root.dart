import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/app_theme/light_theme.dart';
import 'package:notes_app/views/login_screen.dart';
import 'package:notes_app/views/splash_screen.dart';
import '../bloc/note/note_cubit.dart';
import '../views/home_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit()..getNotes(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.light,
        home:SplashScreen(),
      ),
    );
  }
}