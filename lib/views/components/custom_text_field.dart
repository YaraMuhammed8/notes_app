import 'package:flutter/material.dart';

import '../../app_theme/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyboardType;
  String? labelText;
  bool isPassword;
  bool isEmail;
  bool expandField;
  String? hintText;
  IconData? prefixIcon;
  CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      this.isPassword = false,
      this.isEmail = false,
      this.expandField = false,
      this.labelText,
      this.hintText,
      this.prefixIcon})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: (widget.isPassword && hidePassword),
      maxLines: (widget.expandField) ? null : 1,
      minLines: (widget.expandField) ? 5 : 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please fill the filed";
        }
        if ((!widget.isEmail) || value.length > 5 && value.contains('@') && value.endsWith('.com'))
          return null;
        else {
          return "enter a valid email";
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: Icon(widget.prefixIcon),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.bluePrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: (widget.isPassword)
            ? IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: Icon(hidePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))
            : null,
      ),
    );
  }
}
