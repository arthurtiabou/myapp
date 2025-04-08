import 'package:flutter/material.dart';
import '../models/order.dart';

class BookingsPage extends StatelessWidget {
  final List<Order> acceptedOrders;
  final Function(Order) onComplete; // 👈 Ajout ici

  const BookingsPage({
    super.key,
    required this.acceptedOrders,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commandes en cours'),
        centerTitle: true,
      ),
      body: acceptedOrders.isEmpty
          ? const Center(child: Text("Aucune commande en cours."))
          : ListView.builder(
              itemCount: acceptedOrders.length,
              itemBuilder: (context, index) {
                final order = acceptedOrders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(order.image),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(order.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(order.details),
                    trailing: ElevatedButton(
                      onPressed: () {
                        onComplete(order); // 👈 Appel du callback pour marquer comme livrée
                      },
                      child: const Text("Livrée"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
