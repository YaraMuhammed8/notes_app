import 'package:flutter/material.dart';
import 'package:notes_app/app_theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        Text(
          " Notes",
          style: TextStyle(
             color: AppColors.bluePrimaryColor,
              fontSize: 25,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold),
        ),
        Text("App",
            style: TextStyle(
                color: AppColors.lightBluePrimaryColor,
                fontSize: 25,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
