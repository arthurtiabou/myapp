import 'package:flutter/material.dart';
import '../models/order.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  final List<Order> completedOrders;

  const HistoryPage({super.key, required this.completedOrders});

  @override
  Widget build(BuildContext context) {
    final groupedByDate = <String, List<Order>>{};

    for (var order in completedOrders) {
      // clé ISO lisible par DateTime.parse
      final key = DateFormat('yyyy-MM-dd').format(order.date);
      groupedByDate.putIfAbsent(key, () => []).add(order);
    }


    final sortedKeys = groupedByDate.keys.toList()..sort((a, b) => b.compareTo(a));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des livraisons"),
        centerTitle: true,
      ),
      body: completedOrders.isEmpty
          ? const Center(child: Text("Aucune livraison terminée."))
          : ListView.builder(
              itemCount: sortedKeys.length,
              itemBuilder: (context, index) {
                final dateKey = sortedKeys[index];
                final orders = groupedByDate[dateKey]!;
                final dateFormatted = DateFormat.yMMMMd('fr_FR').format(DateTime.parse(dateKey));
                final total = orders.fold(0.0, (sum, o) => sum + o.price);

                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(dateFormatted, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ...orders.map((order) => Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(order.image),
                                backgroundColor: Colors.transparent,
                              ),
                              title: Text(order.title),
                              subtitle: Text(order.details),
                              trailing: Text('\$${order.price.toStringAsFixed(2)}'),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Total: \$${total.toStringAsFixed(2)}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
