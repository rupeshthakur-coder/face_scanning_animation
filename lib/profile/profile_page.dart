import 'package:face_scaning_animation/profile/widget/app_bar.dart';
import 'package:face_scaning_animation/profile/widget/button_card.dart';
import 'package:face_scaning_animation/profile/widget/name_card.dart';
import 'package:face_scaning_animation/profile/widget/profile_list_tile.dart';
import 'package:face_scaning_animation/profile/widget/user_avtar_card.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(title: 'Profile'),
              SizedBox(height: 50),
              UserAvtarCard(),
              SizedBox(height: 30),
              NameCard(name: 'John Doe', skintype: 'Skin Type 1'),
              Spacer(),
              ProfileListTile(icon: Icons.person, title: 'Name'),
              SizedBox(height: 40),
              ProfileListTile(icon: Icons.person, title: 'Name'),
              SizedBox(height: 40),
              ProfileListTile(icon: Icons.person, title: 'Name'),
              SizedBox(height: 40),
              ProfileListTile(icon: Icons.person, title: 'Name'),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: ButtonCard(title: 'Logout', icon: Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
