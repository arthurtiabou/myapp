class BankTransaction {
  final String id;
  final String destinataire;
  final String typeDepense;
  final double montant;
  final DateTime date;

  BankTransaction({
    required this.id,
    required this.destinataire,
    required this.typeDepense,
    required this.montant,
    required this.date,
  });
}
