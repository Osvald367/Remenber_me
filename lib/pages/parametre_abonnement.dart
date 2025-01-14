import 'package:flutter/material.dart';
import 'package:remenber_me/components/appbar.dart';
import 'package:remenber_me/components/colors.dart';

class ParametresAbonnement extends StatefulWidget {
  final String nomService;
  final String logoService;

  const ParametresAbonnement({
    Key? key,
    required this.nomService,
    required this.logoService,
  }) : super(key: key);

  @override
  State<ParametresAbonnement> createState() => _ParametresAbonnementState();
}

class _ParametresAbonnementState extends State<ParametresAbonnement> {
  bool rappelActif = false;
  bool renouvellementAuto = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          titleFirstPart: 'Remember',
          titleSecondPart: 'me',
          logoPath: 'images/logo.png', // Chemin du logo
          profileImagePath: 'images/profile.png', // Chemin de l'image de profil
          onProfileTap: () {
            // Action à effectuer lors du clic sur l'image de profil
            print("Profil cliqué !");
          },
        ),
        body: Container(
          color: AppColors.blanc,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Abonnements Actifs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Paramètres',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 24),
                // Option "Rappels"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.grey),
                        const SizedBox(width: 16),
                        Text(
                          'Rappels',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Switch(
                      value: rappelActif,
                      onChanged: (value) {
                        setState(() {
                          rappelActif = value;
                        });
                      },
                      activeTrackColor:
                          AppColors.vert, // Couleur de la piste active
                    ),
                  ],
                ),
                const Divider(),
                // Option "Renouvellement Auto"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.autorenew, color: Colors.grey),
                        const SizedBox(width: 16),
                        Text(
                          'Renouvellement auto',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Switch(
                      value: renouvellementAuto,
                      onChanged: (value) {
                        setState(() {
                          renouvellementAuto = value;
                        });
                      },
                      activeTrackColor:
                          AppColors.vert, // Couleur de la piste active
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ));
  }
}
