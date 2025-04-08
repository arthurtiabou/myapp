import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aide & Support"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Contactez l'administrateur", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text("Email"),
              subtitle: Text("admin@deliveryapp.com"),
            ),
            const ListTile(
              leading: Icon(Icons.phone_outlined),
              title: Text("Téléphone"),
              subtitle: Text("+33 6 12 34 56 78"),
            ),
            const ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text("Adresse"),
              subtitle: Text("10 Rue des Livraisons, 87000 Limoges, France"),
            ),
          ],
        ),
      ),
    );
  }
}
