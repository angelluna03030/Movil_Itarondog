import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // For form validation

  // Text field controllers for user input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (replace with your actual image path)
          Positioned.fill(
            child: Image.asset(
              "assets/imagen.png",
              // Adjust as needed for image scaling
            ),
          ),

          Center(
            // Center the content vertically
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center form elements
                    children: [
                      Text(
                        "Inicio Sesión",
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 50.0), // Add spacing

                      // Username text field with validation
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: "Usuario",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu nombre de usuario.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0), // Add spacing

                      // Password text field with validation and visibility toggle
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true, // Password field should be hidden
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa tu contraseña.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0), // Add spacing
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "Registro"),
                        child: const Text(
                          'Registrarse',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: AutofillHints.addressCity,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 95.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color(0xFF164894)), // Define el color de fondo
                          minimumSize: MaterialStateProperty.all(Size(
                              double.infinity,
                              50)), // Hace que el botón sea más ancho y alto
                          shadowColor: MaterialStateProperty.all(const Color
                              .fromARGB(255, 255, 255,
                              255)), // Ajusta el color de la sombra si es necesario
                          // Puedes ajustar el padding si necesitas que el botón sea visualmente más "grande"
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(vertical: 10)),
                          // Ajusta el borderRadius si prefieres bordes más redondeados
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // Muestra el SnackBar inmediatamente para indicar que el proceso de inicio de sesión ha comenzado
                            ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    backgroundColor: Color(0xffe44333), // Un azul oscuro como ejemplo
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Iniciando sesión...'),
        CircularProgressIndicator(color: Colors.white), // Añade un indicador de progreso para mejorar la UX
      ],
    ),
    duration: Duration(seconds: 5),
  ),
);
                            // Espera 5 segundos
                            await Future.delayed(Duration(seconds: 5));

                      ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    backgroundColor: Colors.green, // Un verde que simboliza éxito
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start, // Alinea el contenido al inicio del SnackBar
      children: [
        Icon(Icons.check_circle_outline, color: Colors.white), // Ícono de éxito
        SizedBox(width: 16), // Espacio entre el ícono y el texto
        Expanded(child: Text('¡Inicio de sesión exitoso!')), // Texto expandible para evitar el desbordamiento
      ],
    ),
    duration: Duration(seconds: 5), // Duración del SnackBar en pantalla
    action: SnackBarAction(
      label: 'Cerrar', // Opcional: proporciona una acción para cerrar el SnackBar
      textColor: Colors.white,
      onPressed: () {
        // Acción al presionar "Cerrar"
      },
    ),
  ),
);

                            await Future.delayed(Duration(seconds: 2));
                            Navigator.pushNamed(context, "/");
                          }
                        },
                        child: const Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: AutofillHints.addressCity,
                              fontSize: 20),
                        ),
                      ),
                      // Add spacing

                      // Register button with navigation
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
