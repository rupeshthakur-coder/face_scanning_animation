import 'package:flutter/material.dart';

class UserAvtarCard extends StatelessWidget {
  const UserAvtarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xffF7ABCF),
            borderRadius: BorderRadius.circular(150),
          ),
          child: Stack(
            children: [
              const Icon(
                Icons.person,
                color: Colors.white,
                size: 100,
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xffCA6D8E),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
