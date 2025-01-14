import 'package:flutter/material.dart';
import 'package:remenber_me/components/appbar.dart';
import 'package:remenber_me/components/colors.dart';
import 'package:remenber_me/pages/newSuscribe.dart';
import 'package:remenber_me/pages/profile.dart';
import 'package:remenber_me/pages/suscribe.dart';

class AbonnementPage extends StatelessWidget {
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
    return Scaffold(
      appBar: CustomAppBar(
        titleFirstPart: 'Remember',
        titleSecondPart: 'me',
        logoPath: 'images/logo.png', // Chemin du logo
        profileImagePath: 'images/profile.png', // Chemin de l'image de profil
        onProfileTap: () {
          // Action à effectuer lors du clic sur l'image de profil
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
          print("Profil cliqué !");
        }
      ),
      body: Container(
        color: AppColors.blanc, // Set the background color here
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
                  'Abonnements Streaming',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Chercher',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Text('A-Z'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: abonnements.length,
                itemBuilder: (context, index) {
                  final abonnement = abonnements[index];
                  Color iconColor = abonnement['actif']! ? Colors.green : Colors.grey; // Set icon color based on 'actif'

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
                                  color: AppColors.vert, // Set the border color here
                                  width: 1.0, // Set the border width here
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(abonnement['logo']!),
                                backgroundColor: AppColors.blanc,
                                radius: 25,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Action à effectuer lors du clic sur le nom
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SubscriptionDetails()),
                                      );
                                    },
                                    child: Text(
                                      abonnement['nom'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Spacer(), // Pushes the icon and date to the far right
                            Row(
                              children: [
                                Text(
                                  abonnement['date']!,
                                  style: TextStyle(
                                    color: iconColor, // Use the same color for the date text
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.circle,
                                  color: iconColor, // Use the same color for the icon
                                  size: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider( // Add a divider between each item
                        color: Colors.grey.shade300, // Set divider color
                        height: 1, // Set height to make it thinner
                        thickness: 1, // Set thickness of the divider
                        indent: 16, // Space from the left
                        endIndent: 16, // Space from the right
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Alignement des boutons
                children: [
                  const SizedBox(
                      width:
                          180), // Espacement horizontal entre les deux boutons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewSubscribe()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.vert,
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: Text(
                        "Ajouter un Abonnement",
                        style: TextStyle(color: AppColors.blanc),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
