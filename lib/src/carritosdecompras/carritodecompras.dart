import 'package:flutter/material.dart';
import 'package:itarondog/src/Widget/BottonesNavegacion.dart';

class CarritodeCompras extends StatefulWidget {
  @override
  State<CarritodeCompras> createState() => _HistorialCompraState();
}

class _HistorialCompraState extends State<CarritodeCompras> {
  Color myColor = Color.fromARGB(255, 255, 0, 0);
  Color myColor2 = Color.fromARGB(255, 0, 255, 13);

  String numeroperdo = "2413";

  String totalPedidos = "53.000";

  String fechapedido = "23/3/6";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffe44333),
        automaticallyImplyLeading: false, // Esto quita el botón de regreso
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.zero, // Elimina el padding por defecto
          title: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra los elementos en el Row
            children: <Widget>[
              TextButton(
                onPressed: () => Navigator.pushNamed(context, "CarritoCompras"),
                child: const Text(
                  'Mis pedidos',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                ),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "HistorialDeCompra"),
                child: const Text(
                  'Historia',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            // Wrap ListView with Expanded
            child: ListView(
              children: [
                cardCarritoDeCompraInfo(myColor),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
                cardCarritoDeCompraInfo(myColor2),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottonesNavegacionPages(),
    );
  }

  Card cardCarritoDeCompraInfo(Color color) {
    return Card(
      surfaceTintColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(26.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: <Widget>[
            _textoinformativo("Número de pedido: $numeroperdo"),
            SizedBox(height: 4.0),
            _textoinformativo("Total del pedido: $totalPedidos"),
            SizedBox(height: 4.0),
            _textoinformativo("Fecha del pedido: $fechapedido"),
            SizedBox(height: 4.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "MycarritoComprar");
                },
                child: const Icon(Icons.info_outlined, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff164894),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        7.0), // Set corner radius to 0 for a square shape
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _textoinformativo(String info) {
    return Text(info);
  }
}
