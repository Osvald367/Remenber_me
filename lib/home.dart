import 'package:flutter/material.dart';
import 'package:remenber_me/components/colors.dart';
import 'package:remenber_me/components/subscription_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blanc,
        shadowColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          child: Image.asset(
              'images/logo.png'), // Remplacez par le chemin de votre logo
        ),
        title: Row(children: [
          Text(
            'Remember',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.rouge,
            ),
          ),
          SizedBox(width: 5),
          Text(
            'me',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.jaune,
            ),
          ),
        ]),
        centerTitle: false,
        actions: [
          Container(
            width: 50, // Largeur totale du cadre
            height: 50, // Hauteur totale du cadre
            decoration: BoxDecoration(
              color: AppColors.vert, // Couleur d'arrière-plan du cadre
              borderRadius:
                  BorderRadius.circular(10.0), // Rayon des bords arrondis
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(8.0), // Rayon des coins de l'image
              child: Image.asset(
                'images/profile.png', // Remplacez par votre image
                fit: BoxFit.cover, // Ajuste l'image à la boîte
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.blanc, // or backgroundColor: Colors.white
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
              // Carte : Tous les Abonnements
              // Carte : Tous les Abonnements
              SubscriptionCard(
                icon: Icons.library_books,
                iconColor: Colors.black,
                title: "Tous les Abonnements",
                count: 25,
                onTap: () {
                  // Action pour "Tous les Abonnements"
                },
              ),
              const SizedBox(height: 10),
              // Carte : Abonnement Actif
              SubscriptionCard(
                icon: Icons.check_circle,
                iconColor: AppColors.vert,
                title: "Abonnement Actif",
                count: 18,
                onTap: () {
                  // Action pour "Abonnement Actif"
                },
              ),
              const SizedBox(height: 10),
              // Carte : Abonnement Inactif
              SubscriptionCard(
                icon: Icons.cancel,
                iconColor: AppColors.rouge,
                title: "Abonnement Inactif",
                count: 7,
                onTap: () {
                  // Action pour "Abonnement Inactif"
                },
              ),
              Spacer(),
              // Boutons en bas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Action pour "Ajouter une collection"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                    ),
                    child: Text(
                      "Ajouter une collection",
                      style: TextStyle(color: AppColors.noir),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action pour "Ajouter un Abonnement"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.vert,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                    ),
                    child: Text(
                      "Ajouter un Abonnement",
                      style: TextStyle(color: AppColors.blanc),
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

