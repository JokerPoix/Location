import 'package:flutter/material.dart';
import 'package:location/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleContent;
  const CustomAppBar({required this.titleContent, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkBlue,
      title: Text(titleContent, style: const TextStyle(color: white)),
    );
  }
}
