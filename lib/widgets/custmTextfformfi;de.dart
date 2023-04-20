
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {

  Function(String)? onchange;
  bool? obscureText=false;
  String? hintText;
  TextInputType? textInputType;
  CustomTextFormFiled({this.onchange,required this.hintText,this.obscureText=false,this.textInputType});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText!,
      validator: (value) {
        if (value!.trim() == "") {
          return "Please enter ${hintText}";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: '${hintText}',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent)),
      ),
    );

  }
}
