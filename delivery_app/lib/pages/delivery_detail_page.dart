import 'package:flutter/material.dart';
import '../models/order.dart';

class DeliveryDetailPage extends StatefulWidget {
  final Order order;
  final Function(Order) onAccept;

  const DeliveryDetailPage({super.key, required this.order, required this.onAccept});

  @override
  State<DeliveryDetailPage> createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  String orderStatus = "En attente";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma Livraison"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: orderStatus == "En attente" ? Colors.orange[100] : Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  orderStatus,
                  style: TextStyle(
                    color: orderStatus == "En attente" ? Colors.orange : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(widget.order.image),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.order.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text("Tacos au poulet"),
                    const Text("07 52 78 96 70"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.location_on_outlined),
                Text("3.3 km"),
                Icon(Icons.access_time),
                Text("4 mins"),
                Icon(Icons.attach_money),
                Text("\$20.00"),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Date & Time", style: TextStyle(color: Colors.grey)),
                Text("September 1st, 2023 | 12:00 PM", style: TextStyle(fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 16),
            _locationItem("Ma localisation", "35 Oak Ave. San Andreas"),
            _locationItem("So French", "Bank Square, AL 63652"),
            _locationItem("So French", "Bank Square, AL 63652"),
            _locationItem("Anwar Jibawi", "Bank Square, AL 63652"),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() => orderStatus = "En cours");
                  widget.onAccept(widget.order);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("Accepter", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationItem(String title, String address) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.circle, size: 12, color: Colors.green),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(address, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
