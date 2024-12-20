import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileListTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xfffee2f0),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(icon, color: const Color(0xffCA6D8E)),
              ),
              const SizedBox(width: 20),
              Text(title, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 15, color: Color(0xffCA6D8E)),
        ],
      ),
    );
  }
}
