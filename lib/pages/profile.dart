import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24, // Taille ajustée pour correspondre à la maquette
          ),
        ),
     
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


                  Container(  
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      
                        child: Image.asset(
                          'images/Netflix-Logo-2006.png', // Remplacez par le chemin de votre logo
                          height: 100,
                        ),
                    
                    ),
                  ),



                  Text(
                    'Jessie Prescott',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'jessieprescott229@gmail.com',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Informations sur l'enregistrement et l'expiration
            Column(
              children: [
                _detailsRow(Icons.smartphone, 'Telephone', '01 58 25 47 47',
                    showDropdown: true),
                _detailsRow(Icons.email_outlined, 'Email', 'jessie@gmail.com',
                    showDropdown: true),
                _detailsRow(Icons.lock_outlined, 'Changer de mot de passe', ''),
                _detailsRow(Icons.exit_to_app, 'Deconnexion', '',
                    color: Colors.red),
              ],
            ),
            SizedBox(height: 30),
            // Boutons
          ],
        ),
      ),
    );
  }

  Widget _detailsRow(IconData icon, String title, String value,
      {Color color = Colors.grey, bool showDropdown = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color, // Appliquer la couleur à l'icône
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 12, color: color), // Appliquer la couleur au texte
            ),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          if (showDropdown)
            IconButton(
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
              onPressed: () {
                // Action pour ouvrir le dropdown
                print('$title dropdown clicked');
              },
            ),
        ],
      ),
    );
  }
}
