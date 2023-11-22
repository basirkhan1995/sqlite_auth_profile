import 'package:authentication_profile/Components/colors.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const Button({super.key,required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: size.width *.92,
      height: 55,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8)

      ),

      child: TextButton(
        onPressed: onTap,
        child: Text(label,style: const TextStyle(color: Colors.white,fontSize: 16),),
      ),

    );
  }
}
