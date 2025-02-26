import 'package:flutter/material.dart';

class VirementPage extends StatefulWidget {
  final Function(String, String, double) onVirementEffectue;

  const VirementPage({
    Key? key,
    required this.onVirementEffectue,
  }) : super(key: key);

  @override
  State<VirementPage> createState() => _VirementPageState();
}

class _VirementPageState extends State<VirementPage> {
  final _formKey = GlobalKey<FormState>();

  final _destinataireController = TextEditingController();
  final _typeDepenseController = TextEditingController();
  final _montantController = TextEditingController();

  @override
  void dispose() {
    _destinataireController.dispose();
    _typeDepenseController.dispose();
    _montantController.dispose();
    super.dispose();
  }

  void _submitVirement() {
    if (_formKey.currentState!.validate()) {
      final destinataire = _destinataireController.text.trim();
      final typeDepense = _typeDepenseController.text.trim();
      final montant = double.parse(_montantController.text.trim());

      // On appelle la fonction du parent pour enregistrer le virement
      widget.onVirementEffectue(destinataire, typeDepense, montant);

      // On peut remettre le formulaire à zéro ou pop la page
      _destinataireController.clear();
      _typeDepenseController.clear();
      _montantController.clear();

      // Affichage d'un snackBar ou pop
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Virement effectué avec succès!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faire un Virement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Champs destinataire
              TextFormField(
                controller: _destinataireController,
                decoration: const InputDecoration(
                  labelText: 'Destinataire',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez renseigner un destinataire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champs type dépense
              TextFormField(
                controller: _typeDepenseController,
                decoration: const InputDecoration(
                  labelText: 'Type de dépense (ex: loyer, courses...)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Veuillez renseigner un type de dépense';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champs montant
              TextFormField(
                controller: _montantController,
                decoration: const InputDecoration(
                  labelText: 'Montant',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      double.tryParse(value.trim()) == null) {
                    return 'Veuillez saisir un montant valide';
                  }
                  if (double.parse(value.trim()) <= 0) {
                    return 'Le montant doit être supérieur à 0';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              ElevatedButton.icon(
                onPressed: _submitVirement,
                icon: const Icon(Icons.check),
                label: const Text('Valider le Virement'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
