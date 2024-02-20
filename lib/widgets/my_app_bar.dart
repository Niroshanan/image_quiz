import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  const CustomAppBar({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(174, 39, 242, 1),
        borderRadius: BorderRadius.circular(40.0),
      ),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}
