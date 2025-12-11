# 📱 UniTrack – App móvil para gestión de actividades escolares

Esta es la **aplicación móvil (Frontend)** del proyecto **UniTrack**, desarrollada en **Flutter**.  
Permite a los estudiantes registrar, visualizar, editar y eliminar actividades escolares como tareas, exámenes y proyectos.

---

## 🚀 Características principales

- Listado de actividades obtenidas desde la API.
- Crear nuevas actividades con:
  - Materia
  - Título
  - Descripción
  - Fecha de entrega
- Editar y eliminar actividades existentes.
- Vista de detalles en un **bottom sheet**.
- Modo oscuro aplicado en toda la app.
- Pantallas de:
  - Login / Registro de usuario (local).
  - Menú principal.
  - Datos de usuario.
  - Lista de actividades (ReportsScreen).
  - Alta, edición y detalle de actividades.

---

## 🛠 Tecnologías utilizadas

- **Flutter 3.x**
- **Dart**
- `http` para consumir la API REST.
- `shared_preferences` (para datos locales de usuario).
- Navegación con `MaterialPageRoute`.
- Estilos con **Material Design** y colores personalizados.

---

## 🔗 Conexión con el backend

La app se conecta a la API desarrollada en Dart/Shelf.

- URL base de la API:  
  `https://apireport-production.up.railway.app`

Endpoints usados:

- `GET /reports` – Obtener lista de actividades.
- `POST /reports` – Crear actividad.
- `PUT /reports/:id` – Actualizar actividad.
- `DELETE /reports/:id` – Eliminar actividad.

## **Descripción del proyecto**
![Esta es la pagina principal]("https://github.com/user-attachments/assets/75d31d16-9b98-4ceb-892d-60b8787f44a5")
![Pagina de registro](https://github.com/user-attachments/assets/3531e51c-54ab-4222-a112-e966273ac206")
![Menú principal]("https://github.com/user-attachments/assets/c4ff1979-2a52-4624-b233-9d2c7f52363e")
![Pagina con los datos del usuario]("https://github.com/user-attachments/assets/afa5289d-04b0-4573-b9fc-85150f4a4b1d")
![Pagina con las actividades del usuario]("image" src="https://github.com/user-attachments/assets/ac2b8415-9989-4038-8fab-d837d90dae55")
![Puede editar las actividades]("https://github.com/user-attachments/assets/d2a3003f-daee-4d8f-8dc0-9db3410b4b18")
![Eliminar las actividades]("https://github.com/user-attachments/assets/61eaf609-3dcc-4884-b805-05b61427e542")
![O agregar actividades]("https://github.com/user-attachments/assets/6c409733-0331-46ac-ae1e-b9212f06edea")

La configuración de la URL está en:

```dart
// lib/services/api_service.dart
final String baseUrl = 'https://apireport-production.up.railway.app';
