// 📁 lib/screens/admin_page.dart
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleCtrl = TextEditingController();
    final priceCtrl = TextEditingController();
    final detailCtrl = TextEditingController();
    final imageCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter une commande')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Nom du restaurant')),
            const SizedBox(height: 10),
            TextField(controller: priceCtrl, decoration: const InputDecoration(labelText: 'Prix')),
            const SizedBox(height: 10),
            TextField(controller: detailCtrl, decoration: const InputDecoration(labelText: 'Détails (ex: 5 min, 2km)')),
            const SizedBox(height: 10),
            TextField(controller: imageCtrl, decoration: const InputDecoration(labelText: 'URL de l\'image')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Commande ajoutée (simulation)")),
                );
                titleCtrl.clear();
                priceCtrl.clear();
                detailCtrl.clear();
                imageCtrl.clear();
              },
              child: const Text("Ajouter la commande"),
            )
          ],
        ),
      ),
    );
  }
}
