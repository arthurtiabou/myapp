import 'package:flutter/material.dart';
import '../models/order.dart';
import 'delivery_detail_page.dart';
import 'bookings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool isAvailable = true;
  List<Order> acceptedOrders = [];

  final orders = [
    Order(
      title: "KFC",
      image: "https://logo.clearbit.com/kfc.com",
      price: 10.0,
      details: "11 Nearby - 4 mins",
    ),
    Order(
      title: "So French Tacos",
      image: "https://source.unsplash.com/80x80/?tacos",
      price: 25.0,
      details: "3 Nearby - 6 mins",
    ),
    Order(
      title: "Mc Donald",
      image: "https://logo.clearbit.com/mcdonalds.com",
      price: 17.0,
      details: "7 Nearby - 5 mins",
    ),
    Order(
      title: "Burger King",
      image: "https://logo.clearbit.com/bk.com",
      price: 18.0,
      details: "5 Nearby - 7 mins",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _buildHomePage(),
      BookingsPage(acceptedOrders: acceptedOrders),
      const Center(child: Text("Profil")),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Bonjour, Sophie!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text("SD", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _infoCard("Gains Totaux", "45€", Icons.attach_money, Colors.amber[100]!),
                const SizedBox(width: 12),
                _infoCard("En cours", "${acceptedOrders.length}", Icons.directions_bike, Colors.blue[100]!),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recevoir des commandes", style: TextStyle(fontSize: 16)),
                Switch(
                  value: isAvailable,
                  onChanged: (val) => setState(() => isAvailable = val),
                  activeColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (isAvailable)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryDetailPage(
                            order: order,
                            onAccept: (Order acceptedOrder) {
                              setState(() {
                                acceptedOrders.add(acceptedOrder);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(order.image),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(order.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(order.details),
                        trailing: Text("\$${order.price}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              )
            else
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("Vous ne recevez pas de commandes pour le moment.", style: TextStyle(color: Colors.grey)),
              ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String label, String value, IconData icon, Color bgColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
