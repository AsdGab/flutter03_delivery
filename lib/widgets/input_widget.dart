import 'package:flutter/material.dart';
import 'package:flutter03_delivery/utils/colors/colors.dart';

class InputWidget extends StatelessWidget {
  final double marginTop;
  final double paddingLeft;
  final TextInputType keyboardType;
  final bool obscure;
  final TextEditingController textCtrl;
  final String hint;

  const InputWidget(
      {super.key,
      required this.hint,
      required this.marginTop,
      required this.paddingLeft,
      required this.textCtrl,
      this.obscure = false,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.only(left: paddingLeft),
      decoration: BoxDecoration(
          color: inputGris, borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscure,
        controller: textCtrl,
        decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
