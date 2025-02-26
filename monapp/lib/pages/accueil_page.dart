import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  final double soldePrincipal;
  final double soldeLivret;
  final double totalDepenseMois;

  const AccueilPage({
    Key? key,
    required this.soldePrincipal,
    required this.soldeLivret,
    required this.totalDepenseMois,
  }) : super(key: key);

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  // Contrôleur pour le PageView
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCard(String title, String content, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: color),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: [
          // Carte 1 : Solde principal
          _buildCard(
            'Solde Compte Courant',
            '${widget.soldePrincipal.toStringAsFixed(2)} €',
            Icons.account_balance_wallet,
            Colors.indigo,
          ),

          // Carte 2 : Montant dépensé ce mois-ci
          _buildCard(
            'Dépenses du mois',
            '${widget.totalDepenseMois.toStringAsFixed(2)} €',
            Icons.trending_down,
            Colors.redAccent,
          ),

          // Carte 3 : Solde livret
          _buildCard(
            'Solde Livret',
            '${widget.soldeLivret.toStringAsFixed(2)} €',
            Icons.savings,
            Colors.green,
          ),
        ],
      ),
    );
  }
}
