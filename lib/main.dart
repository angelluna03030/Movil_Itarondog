import 'package:flutter/material.dart';
import 'package:itarondog/src/Widget/BottonesNavegacion.dart';
import 'package:itarondog/src/Widget/DrawerPages.dart';
import 'package:itarondog/src/carritosdecompras/HistorialCompra.dart';
import 'package:itarondog/src/home/catalogo.dart';
import 'package:itarondog/src/inforacionproducto/informacion_producto.dart';
import 'package:itarondog/src/micarritocomprar/carritodecomprar.dart';
import 'package:itarondog/src/carritosdecompras/carritodecompras.dart';
import 'package:itarondog/src/informacion_usuario/usuario.dart';
import 'package:itarondog/src/secion/iniciosecion.dart';
import 'package:itarondog/src/secion/registro.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "InicioSecion",
      routes: {
        "/": (context) => MypagesHome(),
        "InicioSecion": (context) => LoginPage(),
        "Registro": (context) => Registro(),
        "InformacionPersonar": (context) => InformacionPersonar(title: 'Informacion personal',),
        "CarritoCompras": (context) => CarritodeCompras(),
        "HistorialDeCompra":(context) =>  HistorialCompra(),
        "MycarritoComprar": (context) => MyCarritoComprar(),
        "InformacionProducto" : (context) => DetailsProduct()
      },
    );
  }
}

class MypagesHome extends StatefulWidget {
  const MypagesHome({super.key});

  @override
  State<MypagesHome> createState() => _MypagesHomeState();
}

class _MypagesHomeState extends State<MypagesHome> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white,),
          )
        ],
        title: Center(child: const Text('Inicio',
        style: TextStyle(color: Colors.white,)
        )),
        backgroundColor: Color(0xffe44333),
      ),
      drawer: DrawerPages(),
      bottomNavigationBar: BottonesNavegacionPages(),

      body: CardList(),
    );
  }
}
