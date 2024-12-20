import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const ButtonCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xfffee2f0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xffCA6D8E)),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 12, color: Color(0xffCA6D8E))),
        ],
      ),
    );
  }
}
