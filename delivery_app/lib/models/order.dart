enum OrderStatus { enCours, livree }

class Order {
  final String title;
  final String image;
  final double price;
  final String details;
  final DateTime date;
  OrderStatus status;

  Order({
    required this.title,
    required this.image,
    required this.price,
    required this.details,
    required this.date,
    this.status = OrderStatus.enCours,
  });
}
