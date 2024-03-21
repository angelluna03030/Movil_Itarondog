import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:itarondog/src/Widget/BottonesNavegacion.dart';
import 'package:itarondog/src/Widget/DrawerPages.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xffe44333),
        title: Center(child: Text("Detaller productos", style: TextStyle(color: Colors.white),)),
        actions: <Widget>[
       IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white,),
          )
        ],
      ),
     bottomNavigationBar: BottonesNavegacionPages(),
     drawer: DrawerPages(

     ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Image.network('https://m.media-amazon.com/images/I/61SWukftcIL._AC_SL1000_.jpg',width: 288),
              SizedBox(
                height: 10.0,
              ),
              const CardExample(),
              SizedBox(
                height: 20.0,
              ),
              const Boton(), 
          ],
        ),
      ),
    );
  }
}
class ElevatedButtonExampleState {
  const ElevatedButtonExampleState();
}
class CardExample extends StatelessWidget {
  const CardExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Color.fromARGB(255, 0, 0, 0).withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 280,
            child: Column(
              children: <Widget>[
                const Text('Vestido Rosa'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Icon(Icons.star),
                    Text(' 0.0   ')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text('       \$ 15.000')
                  ],
                ),
                SizedBox(
                height: 20.0,
              ),
                const Text('Lorem ipsum dolor sit amet consectetur adipiscing, elit mus scelerisque laoreet ac, dapibus dictum netus primis bibendum. Aliquam hendrerit blandit.'),
                SizedBox(
                height: 30.0,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Selecion de tallas'),
                      SizedBox(
                    height: 10.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.snooze_outlined),
                    Text("  "),
                    Icon(Icons.snooze_outlined),
                    Text("  "),
                    Icon(Icons.snooze_outlined),
                    Text("  "),
                    Icon(Icons.snooze_outlined),
                    Text("  "),
                    Icon(Icons.snooze_outlined),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("¿No sabes cómo? Aquí te lo mostramos"),
                  ],
                )
              ],
            ), 
          ),
        ),
      ),
    );
  }
}
class Boton extends StatelessWidget {
  const Boton({Key? key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () =>{
            Navigator.pushNamed(context, "MycarritoComprar")
          },
          child: Row(  
            children: <Widget>[
              Text('Agregar al carrito',),
              SizedBox(width: 10),
              Icon(Icons.shopping_cart_checkout),  
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),//Color(0xFF164894),
            textStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
            maximumSize: Size(250, 50),
            minimumSize: Size(200, 50),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            shadowColor: Color.fromARGB(255, 0, 0, 0),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
        ),
      ),
    );
  }
}