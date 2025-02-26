import 'dart:async';
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
  late PageController _pageController;
  Timer? _timer; 

  final _numPages = 3; 
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
 
      final currentPage = _pageController.page?.round() ?? 0;

      var nextPage = currentPage + 1;

     
      if (nextPage == _numPages) {
        nextPage = 0;
      }

      
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // Annuler le timer pour éviter les fuites
    _timer?.cancel();
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
