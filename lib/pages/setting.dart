import 'package:flutter/material.dart';
import 'package:remenber_me/components/colors.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Variables d'état pour les switches
  bool isAlertEnabled = false;
  bool isSmsEnabled = false;
  bool isEmailEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Paramètres',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section "Général"
            _buildSection(
              "Général",
              [
                _buildSwitchRow(
                  Icons.notifications_outlined,
                  "Alerte",
                  isAlertEnabled,
                  (value) {
                    setState(() {
                      isAlertEnabled = value;
                    });
                  },
                ),
                _buildSwitchRow(
                  Icons.sms_outlined,
                  "Notification SMS",
                  isSmsEnabled,
                  (value) {
                    setState(() {
                      isSmsEnabled = value;
                    });
                  },
                ),
                _buildSwitchRow(
                  Icons.email_outlined,
                  "Notification Email",
                  isEmailEnabled,
                  (value) {
                    setState(() {
                      isEmailEnabled = value;
                    });
                  },
                ),
                _buildDropdownRow(
                  Icons.notifications_active_outlined,
                  "Sonnerie",
                  "Par défaut",
                ),
              ],
            ),
            SizedBox(height: 20),
            // Section "Gestion des abonnements"
            _buildSection(
              "Gestion des abonnements",
              [
                _buildListTile(Icons.attach_money, "Calcul des dépenses"),
                _buildListTile(
                    Icons.bar_chart, "Recommandations pour optimiser"),
                _buildListTile(Icons.history, "Historique des paiements"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget pour une section
  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3), // Décalage de l'ombre
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Column(children: children),
          ],
        ),
      ),
    );
  }

  // Widget pour une ligne avec switch
  Widget _buildSwitchRow(
      IconData icon, String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          Switch(
            activeTrackColor: AppColors.vert,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.white,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  // Widget pour une ligne avec dropdown
  Widget _buildDropdownRow(IconData icon, String title, String dropdownValue) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          DropdownButton<String>(
            value: dropdownValue,
            underline: SizedBox(),
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
            onChanged: (String? newValue) {
              // Action pour le changement de dropdown
            },
            items: <String>['Par défaut', 'Sonnerie 1', 'Sonnerie 2']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Widget pour une ligne simple (Gestion des abonnements)
  Widget _buildListTile(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.grey),
        title: Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        onTap: () {
          // Action pour l'élément
        },
      ),
    );
  }
}
