import 'package:flutter/material.dart';
import 'package:remenber_me/components/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleFirstPart;
  final String titleSecondPart;
  final String logoPath;
  final String profileImagePath;
  final VoidCallback? onProfileTap;

  CustomAppBar({
    required this.titleFirstPart,
    required this.titleSecondPart,
    required this.logoPath,
    required this.profileImagePath,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.blanc,
      shadowColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        child: Image.asset(logoPath), // Affiche le logo
      ),
      title: Row(
        children: [
          Text(
            titleFirstPart,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.rouge,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            titleSecondPart,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.jaune,
            ),
          ),
        ],
      ),
      centerTitle: false,
      actions: [
        GestureDetector(
          onTap: onProfileTap, // Action si l'image du profil est cliquée
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.vert, // Couleur d'arrière-plan du cadre
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                profileImagePath, // Image de profil
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
