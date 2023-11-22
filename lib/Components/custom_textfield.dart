import 'package:authentication_profile/Components/colors.dart';
import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool securePassword;
  final TextEditingController? controller;
  const InputField({super.key,
    required this.label,
    required this.icon,
    this.securePassword = false,
    this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width *.92,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8)
      ),

      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: securePassword,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            icon: Icon(icon),

          ),
        ),
      ),
    );
  }
}
