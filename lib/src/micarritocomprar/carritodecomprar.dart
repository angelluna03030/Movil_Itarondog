import 'package:flutter/material.dart';
import 'package:itarondog/src/Widget/BottonesNavegacion.dart';
import 'package:itarondog/src/Widget/DrawerPages.dart';

void main() {
  runApp(MaterialApp(home: MyCarritoComprar()));
}

class MyCarritoComprar extends StatefulWidget {
  @override
  State<MyCarritoComprar> createState() => _MyCarritoComprarState();
}

class _MyCarritoComprarState extends State<MyCarritoComprar> {

  List<int> _items = List.generate(9, (index) => 1); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: BottonesNavegacionPages(),
      appBar: AppBar(
        title: Center(child: Text("Mi Carrito" , style: TextStyle(color: Colors.white),)),
        backgroundColor: Color(0xffe44333),
         iconTheme: IconThemeData(color: Color(0xffe44333),),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white,),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _cardCarritoCompras(index);
        },
      ),
      drawer: DrawerPages(),
    );
  }

  Card _cardCarritoCompras(int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(26.0),
        child: Row(
          children: <Widget>[
            Container(
                height: 150,
                width: 150,
                child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz5iDtvrd4eFL4HflIdsjIf8k4661BRyRpnFql063KAg&s")),
            Column(
              children: <Widget>[
                Text("Producto ${index + 1}"),
                Text("150000"),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    _buildIncrementButton(index),
                    SizedBox(width: 5),
                    Text(_items[index].toString()),
                    SizedBox(width: 5),
                    _buildDecrementButton(index),
                    _buildDeleteButton(index),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildIncrementButton(int index) => ElevatedButton(
    onPressed: () => _incrementar(index),
    child: const Icon(Icons.add, color: Colors.white),
    style: _buttonStyle(),
  );

  ElevatedButton _buildDecrementButton(int index) => ElevatedButton(
    onPressed: () => _descrementar(index),
    child: const Icon(Icons.remove, color: Colors.white),
    style: _buttonStyle(),
  );

  ElevatedButton _buildDeleteButton(int index) => ElevatedButton(
    onPressed: () => _eliminarItem(index),
    child: const Icon(Icons.delete_rounded, color: Color.fromARGB(255, 0, 0, 0)),
    style: ElevatedButton.styleFrom(
      minimumSize: Size(20, 20),
      padding: EdgeInsets.all(6),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
    ),
  );

  ButtonStyle _buttonStyle() => ElevatedButton.styleFrom(
    minimumSize: Size(30, 30),
    padding: EdgeInsets.all(6),
    backgroundColor: Color(0xff164894),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.0),
    ),
  );

  void _incrementar(int index) {
    setState(() {
      _items[index] += 1;
    });
  }

  void _descrementar(int index) {
    if (_items[index] > 1) {
      setState(() {
        _items[index] -= 1;
      });
    }
  }

  void _eliminarItem(int index) {
    setState(() {
      _items.removeAt(index); // Elimina el elemento de la lista
    });
  }
}
