import 'package:flutter/material.dart';
import 'package:notes_app/app_theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  Function onPress;
  String text;
  CustomButton({Key? key, required this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.pinkPrimaryColor,
            const Color(0xffFFC5C4),
          ],
        )),
        child: MaterialButton(
          onPressed: () {
            onPress();
          },
          height: 60,
          minWidth: double.infinity,
          textColor: Colors.white,
          child: Text(
            text,style:TextStyle(fontSize: 22) ,
          ),
        ));
  }
}
