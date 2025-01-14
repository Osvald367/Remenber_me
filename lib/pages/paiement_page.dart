import 'package:flutter/material.dart';
import 'package:remenber_me/components/colors.dart';

class PaiementPage extends StatelessWidget {
  const PaiementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemple de données de paiement avec des images pour les logos
    final List<Map<String, dynamic>> paiements = [
      {
        "date": "24/12/2024",
        "items": [
          {
            "logo": "images/canalplus.png",
            "title": "Canal +",
            "amount": "10.000 FCFA"
          },
          {
            "logo": "images/canva_pro.png",
            "title": "Canva pro",
            "amount": "10.000 FCFA"
          },
          {
            "logo": "images/moov.png",
            "title": "Illimitée Moov",
            "amount": "15.000 FCFA"
          },
        ],
      },
      {
        "date": "23/12/2024",
        "items": [
          {
            "logo": "images/canva_pro.png",
            "title": "Canva pro",
            "amount": "10.000 FCFA"
          },
          {
            "logo": "images/moov.png",
            "title": "Illimitée Moov",
            "amount": "15.000 FCFA"
          },
        ],
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.blanc,
      appBar: AppBar(
        backgroundColor: AppColors.blanc,
        title: const Text("Paiement"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        itemCount: paiements.length,
        itemBuilder: (context, index) {
          final paiement = paiements[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paiement["date"],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Column(
                  children:
                      List.generate(paiement["items"].length, (itemIndex) {
                    final item = paiement["items"][itemIndex];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                  backgroundImage: AssetImage(item["logo"]),
                                  backgroundColor: AppColors.blanc,
                                  radius: 25,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  item["title"],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                              Text(
                                item["amount"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: AppColors.noir,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0),
                        if (itemIndex != paiement["items"].length + 1)
                          const Divider(
                            thickness: 1.0,
                            color: Colors.grey,
                            height: 1.0,
                          ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
