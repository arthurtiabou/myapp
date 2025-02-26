import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'pages/accueil_page.dart';
import 'pages/historique_page.dart';
import 'pages/virement_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application Bancaire',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Onglet courant (index)
  int _selectedIndex = 0;

  // Exemple de solde initial du compte
  double _soldePrincipal = 1500.0;

  // Exemple de solde d’un livret
  double _soldeLivret = 3000.0;

  // Liste de transactions (historique)
  final List<BankTransaction> _transactions = [
    BankTransaction(
      id: 't1',
      destinataire: 'Supermarché',
      typeDepense: 'Courses',
      montant: 80.50,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    BankTransaction(
      id: 't2',
      destinataire: 'Agence immobilière',
      typeDepense: 'Loyer',
      montant: 650.00,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  /// Calcule le montant total dépensé ce mois-ci (ou sur les 30 derniers jours).
  double get totalDepenseMois {
    DateTime now = DateTime.now();
    DateTime ilYAMois = DateTime(now.year, now.month - 1, now.day);
    // Pour simplifier, on prend la date du mois précédent.
    // Ou on peut filtrer sur le "mois courant" (même year, same month).
    return _transactions
        .where((tx) => tx.date.isAfter(ilYAMois))
        .fold(0.0, (sum, tx) => sum + tx.montant);
  }

  // Méthode pour gérer l’ajout d’un nouveau virement
  void _addVirement(String destinataire, String typeDepense, double montant) {
    setState(() {
      // Ajout dans l’historique
      _transactions.add(
        BankTransaction(
          id: DateTime.now().toString(),
          destinataire: destinataire,
          typeDepense: typeDepense,
          montant: montant,
          date: DateTime.now(),
        ),
      );

      // Mise à jour du solde principal (on simule un débit)
      _soldePrincipal -= montant;
    });
  }

  // Méthode déclenchée lors du changement d’onglet
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // On prépare les pages sous forme de Widget
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      // Page Accueil : on passe au constructeur ce qu’il lui faut pour afficher les KPIs
      AccueilPage(
        soldePrincipal: _soldePrincipal,
        soldeLivret: _soldeLivret,
        totalDepenseMois: totalDepenseMois,
      ),
      // Page Historique : on lui passe la liste des transactions
      HistoriquePage(
        transactions: _transactions,
      ),
      // Page Virement : on lui passe un callback pour créer une transaction
      VirementPage(
        onVirementEffectue: _addVirement,
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Historique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Virement',
          ),
        ],
      ),
    );
  }
}
