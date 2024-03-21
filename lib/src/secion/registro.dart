import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>(); // For form validation


  // Text field controllers for user input

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();

  bool _termsAccepted = false; // Variable para controlar el estado del checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo (opcional, si deseas agregar un fondo)
          Positioned.fill(
            child: Image.asset(
              "assets/imagen.png", // Reemplaza con la ruta a tu imagen
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center form elements
                  children: [
                    Text(
                      "Registrarse ",
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                      ),
                    ),

           SizedBox(height: 3,),
                    TextFormField(
                      controller: _nombreController,
                      decoration: const InputDecoration(
                               contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
    labelStyle: TextStyle(
      fontSize: 14, 
    ),
                        labelText: "Nombre de usuario",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu nombre de usuario.';
                        }
                        return null;
                      },
                    ),

              SizedBox(height: 3,),
                    TextFormField(
                      
                      controller: _apellidoController,
                      decoration: const InputDecoration(
                               contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
    labelStyle: TextStyle(
      fontSize: 14, 
    ),
                        labelText: "Apellido",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu apellido.';
                        }
                        return null;
                      },
                    ),

        SizedBox(height: 3,),
                    TextFormField(
                      controller: _correoController,
                      decoration: const InputDecoration(
                             contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
    labelStyle: TextStyle(
      fontSize: 14, 
    ),
                        labelText: "Correo electrónico",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu correo electrónico.';
                        }
                        return null;
                      },
                    ),

       SizedBox(height: 3,),
                    TextFormField(
                      controller: _numeroController,
                      decoration: const InputDecoration(
                           contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
    labelStyle: TextStyle(
      fontSize: 14, 
    ),
                        labelText: "Número de teléfono",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingresa tu número de teléfono.';
                        }
                        return null;
                      },
                    ),

           SizedBox(height: 3,),
                    TextFormField(
                      
                      controller: _passwordController,
                      obscureText: true, // Password field should be hidden
                      decoration: const InputDecoration(
                           contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
    labelStyle: TextStyle(
      fontSize: 14, 
    ),
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
SizedBox(height: 3,),
      TextFormField(
  controller: _passwordController,
  obscureText: true, // El campo de contraseña debe estar oculto
  decoration: InputDecoration(
    labelText: "Confirmar contraseña",
    border: OutlineInputBorder(),
    // Reduce el padding interior para hacer el campo más pequeño
    contentPadding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
 
    labelStyle: TextStyle(
     fontSize: 14, 
    ),
  ),
  style: TextStyle(
    fontSize: 14, // Reduce el tamaño del texto ingresado
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa tu contraseña.';
    }
    return null;
  },
),


  Row(
  children: [
    Checkbox(
      activeColor: Color(0xffe44333),
      value: _termsAccepted,
      onChanged: (bool? newValue) {
        setState(() {
          _termsAccepted = newValue!;
        });
      },
    ),
    Text("Aceptar términos y condiciones de uso"),
  ],
),
TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "InicioSecion"),
                        child: const Text(
                          'Ya tengo una cuenta',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                             
                              fontSize: 15),
                        ),
                      ),
 bottonregistro()
         
            
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  











ElevatedButton bottonregistro() {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xFF164894)), // Define el color de fondo
      minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)), // Hace que el botón sea más ancho y alto
      shadowColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)), // Ajusta el color de la sombra
      padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)), // Ajusta el padding
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    onPressed: _termsAccepted ? () async {
      if (_formKey.currentState!.validate()) {
        // Muestra el SnackBar para indicar que el proceso de inicio de sesión ha comenzado
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffe44333),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Verificando información...'),
              CircularProgressIndicator(color: Colors.white),
            ],
          ),
          duration: Duration(seconds: 5),
        ));

        // Espera 5 segundos
        await Future.delayed(Duration(seconds: 5));

        // Muestra otro SnackBar para indicar el éxito de la operación
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.check_circle_outline, color: Colors.white),
              SizedBox(width: 16),
              Expanded(child: Text('¡Registrado correctamente!')),
            ],
          ),
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Cerrar',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ));

        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, "InicioSecion");
      }
    } : null, // El botón se deshabilitará si _termsAccepted es false
    child: const Text(
      'Registrarme',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20),
      ),
  );
}
















}
