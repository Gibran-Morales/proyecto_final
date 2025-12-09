import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_input.dart';
import 'menu_screen.dart'; 
import 'user_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // validar email 
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegExp.hasMatch(email);
  }

  //  validar telefonoo
  bool _isValidPhone(String phone) {
    final phoneRegExp = RegExp(r'^\d{10}$');
    return phoneRegExp.hasMatch(phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                "Login",
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
                labelText: 'Correo Electrónico',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 16),

              CustomInput(
                labelText: 'Telefono',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
              ),
              const SizedBox(height: 16),

              CustomInput(
                labelText: 'Contraseña',
                prefixIcon: Icons.lock,
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 30),

              CustomInput(
                labelText: 'Confirmar Contraseña',
                prefixIcon: Icons.lock,
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 30),

              BotonPersonalizado(
                texto: 'Registrarse',
                onPressed: () {
                  final name = _nameController.text.trim();
                  final email = _emailController.text.trim();
                  final phone = _phoneController.text.trim();
                  final password = _passwordController.text.trim();
                  final confirmPassword = _confirmPasswordController.text.trim();

                  if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, ingresa todos los datos')),
                    );
                    return;
                  }

                  if (!_isValidEmail(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Correo electronico invalido')),
                    );
                    return;
                  }

                  if (!_isValidPhone(phone)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Numero de telefono invalido (debe ser 10 digitos numericos)')),
                    );
                    return;
                  }

                  if (password != confirmPassword) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Las contraseñas no coinciden')),
                    );
                    return;
                  }

                  UserManager.registerUser(
                    name: name,
                    email: email,
                    phone: phone,
                    password: password,
                  );

                  Navigator.pushReplacement( 
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
                colorFondo: const Color.fromRGBO(142, 21, 21, 1),
                colorTexto: Colors.white,
                paddingHorizontal: 28,
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