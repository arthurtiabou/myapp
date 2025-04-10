// 📁 lib/screens/login_page.dart
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool isLoading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Bienvenue !", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mot de passe', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(error!, style: const TextStyle(color: Colors.red)),
              ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        setState(() {
                          isLoading = true;
                          error = null;
                        });
                        await Future.delayed(const Duration(seconds: 1)); // 🔧 Simulation de connexion
                        setState(() => isLoading = false);

                        // 🔧 En attendant Firebase, on simule un rôle pour test
                        final email = emailCtrl.text.trim();
                        if (email.contains("admin")) {
                          Navigator.pushReplacementNamed(context, '/admin');
                        } else {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Se connecter"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
