import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_input.dart';
import 'menu_screen.dart'; 
import 'user_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Inicio de Sesion",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              CustomInput(
                labelText: 'Usuario',
                prefixIcon: Icons.person,
                controller: _nameController,
              ),
              const SizedBox(height: 16),

              CustomInput(
                labelText: 'Contraseña',
                prefixIcon: Icons.lock,
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      color: Color.fromRGBO(142, 21, 21, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              BotonPersonalizado(
                texto: 'Login',
                onPressed: () {
                  final name = _nameController.text.trim();
                  final password = _passwordController.text.trim();

                  if (name.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ingresa usuario y contraseña')),
                    );
                    return;
                  }

                  if (UserManager.loginUser(name, password)) {
                    Navigator.pushReplacement( // Cambiado a pushReplacement
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registrese primero.')),
                    );
                  }
                },
                colorFondo: const Color.fromRGBO(142, 21, 21, 1),
                colorTexto: Colors.white,
                paddingHorizontal: 25,
                paddingVertical: 12,
              ),
              const SizedBox(height: 20),

              BotonPersonalizado(
                texto: "Volver",
                onPressed: () {
                  Navigator.pop(context);
                },
                colorFondo: Colors.white,
                colorTexto: const Color.fromRGBO(142, 21, 21, 1),
                colorBorde: const Color.fromRGBO(142, 21, 21, 1),
                paddingHorizontal: 40,
                paddingVertical: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}