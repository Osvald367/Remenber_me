import 'package:flutter/material.dart';
import 'package:remenber_me/components/appbar.dart';
import 'package:remenber_me/components/colors.dart';
import 'package:remenber_me/components/subscription_card.dart';
import 'package:remenber_me/pages/abonnement.dart';
import 'package:remenber_me/pages/abonnement_actif.dart';
import 'package:remenber_me/pages/abonnement_inactif.dart';
import 'package:remenber_me/pages/collection_page.dart';
import 'package:remenber_me/pages/parametre_abonnement.dart';

class HomeScreen extends StatelessWidget {
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
            MaterialPageRoute(builder: (context) => ParametresAbonnement(nomService: '', logoService: '',)),
          );
          print("Profil cliqué !");
        },
      ),
      body: Container(
        color: AppColors.blanc,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                "Mes Abonnements",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SubscriptionCard(
                icon: Icons.library_books,
                iconColor: Colors.black,
                title: "Tous les Abonnements",
                count: 25,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AbonnementPage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              SubscriptionCard(
                icon: Icons.check_circle,
                iconColor: AppColors.vert,
                title: "Abonnement Actif",
                count: 18,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AbonnementActifPage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              SubscriptionCard(
                icon: Icons.cancel,
                iconColor: AppColors.rouge,
                title: "Abonnement Inactif",
                count: 7,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AbonnementInactifPage()),
                  );
                },
              ),
              Spacer(),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Alignement des boutons
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CollectionPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: Text(
                        "Ajouter une collection",
                        style: TextStyle(color: AppColors.noir),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width:
                          10), // Espacement horizontal entre les deux boutons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => AbonnementPage()),
                        // );
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
