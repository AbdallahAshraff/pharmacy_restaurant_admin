import 'package:flutter/material.dart';

class Myformfield extends StatelessWidget {
  const Myformfield(
      {super.key,
      required this.keyboardType,
      this.obscureText = false,
      this.suffixIcon,
     this.prefixIcon,
      required this.labelText,
      required this.validator,
      this.controller,
      this.onTap,
      this.onChanged});
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onTap: onTap,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
      ),
    );
  }
}
