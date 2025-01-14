import 'package:flutter/material.dart';
import 'package:remenber_me/components/appbar.dart';
import 'package:remenber_me/components/colors.dart';
import 'package:remenber_me/pages/profile.dart';

class NewSubscribe extends StatefulWidget {
  @override
  _NewSubscribeState createState() => _NewSubscribeState();
}

class _NewSubscribeState extends State<NewSubscribe> {
  String selectedService = 'Netflix';
  String selectedDuration = '1an';

  final List<Map<String, String>> services = [
    {'name': 'Spotify', 'image': 'images/spotify.png'},
    {'name': 'Figma', 'image': 'images/figma.png'},
    {'name': 'Canal +', 'image': 'images/canalplus.png'},
    {'name': 'Isocel', 'image': 'images/netflix.png'},
    {'name': 'Netflix', 'image': 'images/netflix.png'},
    {'name': 'Canva', 'image': 'images/canva_pro.png'},
    {'name': 'Amazon', 'image': 'images/amazon.png'},
    {'name': 'Nextmux pay', 'image': 'images/netflix.png'},
    {'name': 'Disney +', 'image': 'images/disney.png'},
    {'name': 'Coursera', 'image': 'images/coursera.png'},
    {'name': 'LinkedIn', 'image': 'images/linkedIn.png'},
    {'name': 'Microsoft', 'image': 'images/microsoft.png'},
  ];

  final List<String> durations = ['1an', '6mois', '3mois', '1mois'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          titleFirstPart: 'Remember',
          titleSecondPart: 'me',
          logoPath: 'images/logo.png', // Chemin du logo
          profileImagePath: 'images/profile.png',
          onProfileTap: () {
            // Action à effectuer lors du clic sur l'image de profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
            print("Profil cliqué !");
          } // Chemin de l'image de profil
          ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Titre principal
            const Text(
              'Nouvel Abonnement',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Champs "Nom"
            _buildRow(
              title: 'Nom',
              child: DropdownButton<String>(
                value: selectedService,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                onChanged: (value) {
                  setState(() {
                    selectedService = value!;
                  });
                },
                items: services.map((service) {
                  return DropdownMenuItem<String>(
                    value: service['name'], // Le nom du service
                    child: Row(
                      children: [
                        Image.asset(
                          service['image']!,
                          height: 20,
                          width: 20,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(service['name']!),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            // Champs "Collection"
            _buildRow(title: 'Collection', child: const Text('Streaming')),

            // Champs "Durée"
            _buildRow(
              title: 'Durée',
              child: DropdownButton<String>(
                value: selectedDuration,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                dropdownColor: Colors.white,
                underline: const SizedBox(),
                onChanged: (value) {
                  setState(() {
                    selectedDuration = value!;
                  });
                },
                items: durations.map((String duration) {
                  return DropdownMenuItem<String>(
                    value: duration, // La valeur de durée
                    child: Text(duration),
                  );
                }).toList(),
              ),
            ),

            // Champs "Début"
            _buildRow(title: 'Début', child: _buildDateRow('01/02/2021')),

            // Champs "Fin"
            _buildRow(title: 'Fin', child: _buildDateRow('01/02/2022')),

            // Icon
            _buildRow(
              title: "Icon",
              child: _buildIconRow(),
            ),

            // Champs "Lien de la page d'abonnement"
            _buildRow(
              title: "Lien de la page d'abonnement",
              child: _buildLinkRow(),
            ),

            // Champs "Date d'alerte"
            _buildRow(
              title: "Date d'alerte",
              child: _buildDateRow('14/08/2025'),
            ),

            const SizedBox(height: 30),

            // Boutons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Annuler',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Action Enregistrer
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.vert,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Enregistrer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRow(String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          date,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon:
              Icon(Icons.calendar_today, color: Colors.grey.shade600, size: 20),
          onPressed: () {
            // Logic de sélection de date
          },
        ),
      ],
    );
  }

  Widget _buildIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon:
              Icon(Icons.image_outlined, color: Colors.grey.shade600, size: 20),
          onPressed: () {
            // Logic pour l'icône
          },
        ),
      ],
    );
  }

  Widget _buildLinkRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(Icons.link, color: Colors.grey.shade600, size: 20),
          onPressed: () {
            // Logic pour le lien
          },
        ),
      ],
    );
  }

  Widget _buildRow({required String title, required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300, // Couleur de la bordure
            width: 1.0, // Épaisseur de la bordure
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerRight,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
