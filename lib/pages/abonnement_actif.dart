import 'package:flutter/material.dart';
import 'package:remenber_me/components/appbar.dart';
import 'package:remenber_me/components/colors.dart';

class AbonnementActifPage extends StatelessWidget {
  final List<Map<String, dynamic>> abonnements = [
    {
      'logo': 'images/netflix.png',
      'nom': 'Netflix',
      'date': '10/05/2025',
      'actif': true,
    },
    {
      'logo': 'images/spotify.png',
      'nom': 'Spotify',
      'date': '10/05/2025',
      'actif': false,
    },
    {
      'logo': 'images/canalplus.png',
      'nom': 'Canal +',
      'date': '10/05/2025',
      'actif': true,
    },
    {
      'logo': 'images/primevideo.png',
      'nom': 'Prime Video',
      'date': '10/05/2025',
      'actif': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtrer les abonnements actifs
    final abonnementsActifs =
        abonnements.where((abonnement) => abonnement['actif'] == true).toList();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
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
            Expanded(
              child: ListView.builder(
                itemCount: abonnementsActifs.length,
                itemBuilder: (context, index) {
                  final abonnement = abonnementsActifs[index];
                  Color iconColor = Colors.green; // Couleur fixe pour actifs

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.vert,
                                  width: 1.0,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(abonnement['logo']),
                                backgroundColor: AppColors.blanc,
                                radius: 25,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    abonnement['nom'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(), // Pousse l'icône et la date à droite
                            Row(
                              children: [
                                Text(
                                  abonnement['date'],
                                  style: TextStyle(
                                    color: iconColor,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.circle,
                                  color: iconColor,
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                        thickness: 1,
                        indent: 16,
                        endIndent: 16,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
