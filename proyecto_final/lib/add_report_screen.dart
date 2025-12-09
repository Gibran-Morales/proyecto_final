import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../services/api_service.dart';

class AddReportScreen extends StatefulWidget {
  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final materia = TextEditingController();
  final titulo = TextEditingController();
  final descripcion = TextEditingController();
  final fechaEntrega = TextEditingController();

  final api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Reporte"),
        backgroundColor: const Color.fromRGBO(142, 21, 21, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: materia,
                decoration: InputDecoration(labelText: "Materia"),
                validator: (v) => v!.isEmpty ? "Campo requerido" : null,
              ),

              TextFormField(
                controller: titulo,
                decoration: InputDecoration(labelText: "Título"),
                validator: (v) => v!.isEmpty ? "Campo requerido" : null,
              ),

              TextFormField(
                controller: descripcion,
                decoration: InputDecoration(labelText: "Descripción"),
              ),

              TextFormField(
                controller: fechaEntrega,
                decoration: InputDecoration(labelText: "Fecha de entrega"),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(142, 21, 21, 1),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Guardar"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final activity = Activity(
                      id: 0,
                      materia: materia.text,
                      titulo: titulo.text,
                      descripcion: descripcion.text,
                      fechaEntrega: fechaEntrega.text,
                      estado: "pendiente",
                    );

                    final ok = await api.addActivity(activity);

                    if (ok) {
                      Navigator.pop(context, true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error al guardar")),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
