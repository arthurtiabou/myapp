import 'package:flutter/material.dart';
import '../models/transaction.dart';

class HistoriquePage extends StatelessWidget {
  final List<BankTransaction> transactions;

  const HistoriquePage({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historique'),
        centerTitle: true,
      ),
      body: transactions.isEmpty
          ? const Center(
              child: Text('Aucune transaction pour le moment.'),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tx = transactions[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(
                        tx.montant.toStringAsFixed(0),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text('${tx.destinataire} - ${tx.typeDepense}'),
                    subtitle: Text(
                      'Montant: ${tx.montant.toStringAsFixed(2)} € \nDate: '
                      '${tx.date.day}/${tx.date.month}/${tx.date.year}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
