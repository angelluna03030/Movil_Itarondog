import 'package:flutter/material.dart';
class DrawerPages extends StatefulWidget {
  const DrawerPages({super.key});
  @override
  State<DrawerPages> createState() => _DrawerPagesState();
}
class _DrawerPagesState extends State<DrawerPages> {
  bool mejorCalificados = false;
  bool masComprado = false;
  bool masEconomicos = false;
  bool recienAnadidos = false;
  bool escasos = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        SizedBox(
          height: 80,
        ),
        checkboxWidget(mejorCalificados, "Mejor calificados", () {
          setState(() {
            mejorCalificados = !mejorCalificados;
          });
        }),
        checkboxWidget(masComprado, "Más Comprado", () {
          setState(() {
            masComprado = !masComprado;
          });
        }),
        checkboxWidget(masEconomicos, "Más económicos", () {
          setState(() {
            masEconomicos = !masEconomicos;
          });
        }),
        checkboxWidget(recienAnadidos, "Recién añadidos", () {
          setState(() {
            recienAnadidos = !recienAnadidos;
          });
        }),
        checkboxWidget(escasos, "Escasos", () {
          setState(() {
            escasos = !escasos;
          });
        }),
      ]),
    );
  }
  Widget checkboxWidget(bool valor, String info, VoidCallback toggleState) {
    return Row(
      children: [
        Checkbox(
          activeColor:  Color(0xffe44333),
          value: valor,
          onChanged: (value) {
            toggleState();
          },
        ),
        Text(info),
      ],
    );
  }
}
