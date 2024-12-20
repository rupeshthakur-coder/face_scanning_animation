import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  const NameCard({super.key, required this.name, required this.skintype});
  final String name;
  final String skintype;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Name'),
        Text(skintype,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xffCA6D8E),
            )),
      ],
    );
  }
}
