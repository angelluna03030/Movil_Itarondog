import 'package:flutter/material.dart';
import 'package:itarondog/src/Models/inforaconHorizontal.dart';
import 'package:itarondog/src/home/catalogo_horizontal.dart';


class CardList extends StatefulWidget {
 
  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
List<InforCardHorizontal> listaDePeliculas = [
    InforCardHorizontal(titulo: "Película 1", imageUrl: "assets/pelicula1.jpg"),
    InforCardHorizontal(titulo: "Película 2", imageUrl: "assets/pelicula2.jpg"),
    // Agrega más elementos según sea necesario
  ];

  void cargarMasPeliculas() {
   
    var nuevaPelicula = InforCardHorizontal(titulo: "Nueva Película", imageUrl: "assets/nueva_pelicula.jpg");
    setState(() {
      listaDePeliculas.add(nuevaPelicula);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: const [
          CardProduct(),
CardHorizontal(
        peliculas: listaDePeliculas,
        siguientePagina: cargarMasPeliculas,
      ),

        ],
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        color: const Color(0xFFEEEEEE),
        shadowColor: const Color(0xFF777777),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Container(
          padding: const EdgeInsets.all(9.0),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
            color: const Color(0xFFFFFFFF),
            border: Border.all(
              width: 1,
              style: BorderStyle.solid,
              color: const Color(0xFFAAAAAA),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                  'https://th.bing.com/th/id/OIP.BdFkBMNugR_eKSDA_LZkUQAAAA?w=135&h=180&c=7&r=0&o=5&cb=11&pid=1.7'),
              Text(
                'Nombre de este producto',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Calibri', // Corrección tipográfica
                ),
              ),
              // Price and stars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    '\$9.999.999',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Stars(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  MoreInfo(),
                  AddShoppingCart(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MoreInfo extends StatelessWidget {
  const MoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF164894)),
      ),
      onPressed: () {
        Navigator.pushNamed(context, "InformacionProducto");
      },
      child: const Text(
        'Ver más',
        style: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
        ),
      ),
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.star, color: Color(0xFF164894)),
        Icon(Icons.star, color: Color(0xFF164894)),
        Icon(Icons.star, color: Color(0xFF164894)),
        Icon(Icons.star, color: Color(0xFF164894)),
        Icon(Icons.star_half,
            color: Color(
                0xFF164894)), // Para representar una calificación de 4.5 por ejemplo
        Text(
          '4.5',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ],
    );
  }
}

class AddShoppingCart extends StatelessWidget {
  const AddShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF164894)),
      ),
      onPressed: () {},
      child: const Icon(
        Icons.add_shopping_cart,
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
