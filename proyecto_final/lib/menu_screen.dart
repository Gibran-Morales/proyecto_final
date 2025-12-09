import 'package:flutter/material.dart';
import 'data_screen.dart';
import 'reports_screen.dart';
import 'user_manager.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = UserManager.getUserData()!; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        backgroundColor: const Color.fromRGBO(142, 21, 21, 1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Bienvenido',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataScreen(
                      title: 'Datos de Usuario',
                      name: userData['name'],
                      email: userData['email'],
                      phone: userData['phone'],
                      password: userData['password'],
                      isLogin: true,
                    ),
                  ),
                );
              },
             style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(142, 21, 21, 1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('Ver Datos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportsScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromRGBO(142, 21, 21, 1),
                side: const BorderSide(color: Color.fromRGBO(142, 21, 21, 1)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('Ver Reportes'),
            ),
          ],
        ),
     ),
);
}
}