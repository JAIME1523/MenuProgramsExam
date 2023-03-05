import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomImput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextInputType keyboardRype;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomImput(
      {super.key,
      required this.icon,
      required this.placeholder,
      this.keyboardRype = TextInputType.text,
      this.isPassword = false,
      required this.onChanged,
      this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            )
          ]),
      child: TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          obscureText: isPassword,
          autocorrect: false,
          keyboardType: keyboardRype,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Colors.white,
              ),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: placeholder)),
    );
  }
}
