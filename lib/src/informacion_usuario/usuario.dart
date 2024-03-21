import 'package:flutter/material.dart';
import 'package:itarondog/src/Widget/BottonesNavegacion.dart';
import 'package:itarondog/src/Widget/DrawerPages.dart';

class InformacionPersonar extends StatefulWidget {
  const InformacionPersonar({super.key, required this.title});

  final String title;

  @override
  State<InformacionPersonar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InformacionPersonar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPages(),
        bottomNavigationBar: BottonesNavegacionPages(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffe44333),
          title: const Center(child: Text('Ajustes de cuenta')),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                maxRadius: 85,
              ),
              const SizedBox(
                height: 25,
              ),
              informacionRow(),
            
                columInformacionUsuario()
                
              ,
              cardPedidos(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Ver mas",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff164894),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          7.0), // Set corner radius to 0 for a square shape
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Text _textoAMostrar(String informacion, double tamanioFuente, bool negrilla) {
    return Text(
      informacion,
      style: TextStyle(
        fontSize: tamanioFuente,
        fontWeight: negrilla == true ? FontWeight.bold : null,
      ),
    );
  }

  Row informacionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _textoAMostrar('Informacion Personal', 30, true),
        IconButton(
          icon: const Icon(Icons.edit),
          iconSize: 35,
          tooltip: 'Edita tu cuenta',
          onPressed: () {
            showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 225,
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      _textoAMostrar('Editar Foto:', 23, true),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                          const snackBar = SnackBar(
                            content: Text('Foto editada con exito'),
                            backgroundColor: Color.fromARGB(255, 11, 190, 20),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Tomar foto'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                          const snackBar = SnackBar(
                            content: Text('Foto editada con exito'),
                            backgroundColor: Color.fromARGB(255, 11, 190, 20),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('Seleccionar foto'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            foregroundColor: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Column columInformacionUsuario() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 5,
        ),
        _textoAMostrar('Correo Electronico:', 23, true),
        _textoAMostrar('ejemplo@itarondog.com', 20, false),
        const SizedBox(
          height: 5,
        ),
        _textoAMostrar('Numero De Contacto:', 23, true),
        _textoAMostrar('3003604438', 20, false),
        const SizedBox(
          height: 5,
        ),
        _textoAMostrar('Nombre:', 23, true),
        _textoAMostrar('Ejemplo:', 20, false),
        const SizedBox(
          height: 5,
        ),
        _textoAMostrar('Apellido:', 23, true),
        _textoAMostrar('Ejemplo:', 20, false),
      ],
    );
  }

  Card cardPedidos() {
    return Card(
      color: const Color.fromARGB(255, 233, 227, 227),
      child: SizedBox(
          width: 350,
          height: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center, // Adjust as needed
            children: [
              _textoAMostrar('Total de pedidos: 3', 20, false),
              _textoAMostrar('Total de pedidos pagados: 2', 20, false),
              _textoAMostrar('Total de pedidos por recoger: 1', 20, false),
            ],
          )),
    );
  }
}
