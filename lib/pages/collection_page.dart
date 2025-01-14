import 'package:flutter/material.dart';
import 'package:remenber_me/components/appbar.dart';
import 'package:remenber_me/components/colors.dart';
import 'package:remenber_me/pages/paiement_page.dart';

class CollectionPage extends StatelessWidget {
  // Final list of collections
  final List<Map<String, dynamic>> collections = [
    {'title': 'Streaming', 'count': 7},
    {'title': 'Web', 'count': 12},
    {'title': 'Manuel', 'count': 31},
    {'title': 'Bobe', 'count': 67},
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
                    MaterialPageRoute(builder: (context) => PaiementPage()),
                  );
          print("Profil cliqué !");
        },
      ),
      body: Container(
        color: AppColors.blanc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Collections",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Nombre de colonnes
                    mainAxisSpacing: 10, // Espacement vertical
                    crossAxisSpacing: 10, // Espacement horizontal
                    childAspectRatio: 1, // Ratio largeur/hauteur
                  ),
                  itemCount: collections.length + 1, // Add 1 for the "Add Collection" card
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // First item is the "Add Collection" card
                      return GestureDetector(
                        onTap: () {
                          print("Ajouter une collection cliqué !");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.black,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Ajouter une Collection",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      // Other collection cards
                      final collection = collections[index - 1]; // Offset by 1 to skip the "Add" card
                      return buildCollectionCard(collection['title'], collection['count']);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour une carte de collection
  Widget buildCollectionCard(String title, int count) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/icone_dossier.png"), // Chemin de l'image
          // fit: BoxFit.cover, // S'étend pour couvrir tout l'écran
          alignment: Alignment.topCenter,
        ),
        color: AppColors.blanc, // Couleur de la carte
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              "$count Abonnements",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
