import 'package:flutter/material.dart';

class NewSubscribe extends StatefulWidget {
  @override
  _NewSubscribeState createState() => _NewSubscribeState();
}

class _NewSubscribeState extends State<NewSubscribe> {
  String selectedService = 'Netflix';
  String selectedDuration = '1an';

  final List<String> services = [
    'Spotify',
    'Figma',
    'Canal +',
    'Isocel',
    'Netflix',
    'Canva',
    'Amazon',
    'Nextmux pay',
    'Disney +',
    'Coursera',
    'LinkedIn',
    'Microsoft'
  ];

  final List<String> durations = ['1an', '6mois', '3mois', '1mois'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Titre principal
            Text(
              'Nouvel Abonnement',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            // Champs "Nom"
           _buildRow(
  title: 'Nom',
  child: DropdownButton<String>(
    value: selectedService,
    icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
    dropdownColor: Colors.white, // Arrière-plan blanc du menu
    underline: SizedBox(),
    onChanged: (value) {
      setState(() {
        selectedService = value!;
      });
    },
    items: services.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Row(
          children: [
            // Icône dynamique pour chaque service
            if (value == 'Netflix')
              Image.asset(
                'images/Netflix-Logo-2006.png',
                height: 15,
              ),
      //      if (value == 'Spotify')
       //        Image.asset(
       //          'images/spotify.png',
      //           height: 15,
       //        ),
      //       if (value == 'Figma')
      //         Image.asset(
       //          'images/figma.png',
        //         height: 15,
        //       ),
        //     if (value == 'Canal +')
        //       Image.asset(
         //        'images/canal.png',
        //         height: 15,
         //      ),
         //    if (value == 'Amazon')
              Image.asset(
                'images/az.png',
                height: 15,
              ),
            SizedBox(width: 10),
            Text(value),
          ],
        ),
      );
    }).toList(),
  ),
),

            _buildRow(title: 'Collection', child: Text('Streaming')),
            // Champs "Durée"
            _buildRow(
              title: 'Durée',
              child: DropdownButton<String>(
                value: selectedDuration,
                icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
    dropdownColor: Colors.white, // Arrière-plan blanc du menu

                underline: SizedBox(),
                onChanged: (value) {
                  setState(() {
                    selectedDuration = value!;
                  });
                },
                items: durations.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            // Champs "Début"
            _buildRow(title: 'Début', child: _buildDateRow('01/02/2021')),
            // Champs "Fin"
            _buildRow(title: 'Fin', child: _buildDateRow('01/02/2022')),
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
            SizedBox(height: 30),
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
                  child: Text(
                    'Annuler',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Action Enregistrer
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
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
      children: [
        Spacer(),
        Container(
          child: Text(
            date,
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(width: 8),
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
      children: [
        Spacer(), // Pousse l'icône à l'extrémité droite
        IconButton(
          icon:
              Icon(Icons.image_outlined, color: Colors.grey.shade600, size: 20),
          onPressed: () {
            // Logic pour le lien
          },
        ),
      ],
    );
  }

  Widget _buildLinkRow() {
    return Row(
      children: [
        Spacer(), // Pousse l'icône à l'extrémité droite
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
              style: TextStyle(fontSize: 16, color: Colors.grey),
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
