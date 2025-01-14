import 'package:flutter/material.dart';

class SubscriptionDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Netflix',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Action pour ouvrir les paramètres
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Logo
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'images/Netflix-Logo-2006.png', // Remplacez par le chemin de votre logo
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '5.000 FCFA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Actif',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Informations sur l'enregistrement et l'expiration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _infoCard('Enregistrement', '12/05/2021'),
                _infoCard('Expiration', '23/12/2024', isHighlighted: true),
              ],
            ),
            SizedBox(height: 20),
            // Détails
            _detailsRow('Catégorie', 'Streaming'),
            _detailsRow('Collection', 'Streaming'),
            _detailsRow('Durée', '1 an'),
            _detailsRow('Début', '10/12/2024'),
            _detailsRow('Fin', '10/12/2025'),
            SizedBox(height: 30),
            // Boutons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _actionButton('Aller sur le site', Colors.green, Colors.white),
                SizedBox(width: 5), // Espacement entre les boutons
                _actionButton('Modifier', Colors.green, Colors.white),
                SizedBox(width: 3), // Espacement entre les boutons
                _actionButton('Supprimer', Colors.red, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String date, {bool isHighlighted = false}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
            blurRadius: 5, // Rayon de flou
            spreadRadius: 1, // Rayon de diffusion
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre
                      blurRadius: 5, // Rayon de flou
                      spreadRadius: 1, // Rayon de diffusion
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 25, // Définir la taille de l'icône
                ),
              ),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              color: isHighlighted ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailsRow(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300, // Couleur de la bordure
            width: 1.0, // Épaisseur de la bordure
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Espacement vertical
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text, Color color, Color textColor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          // Ajoutez ici votre logique
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0,
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
