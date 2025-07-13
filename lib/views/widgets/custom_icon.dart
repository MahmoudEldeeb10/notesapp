import 'package:flutter/material.dart';

class CsutomSearchIcon extends StatelessWidget {
  const CsutomSearchIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Icon(icon, size: 28)),
    );
  }
}
