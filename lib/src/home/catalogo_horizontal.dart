import 'package:flutter/material.dart';
import 'package:itarondog/src/Models/inforaconHorizontal.dart';



class CardHorizontal extends StatelessWidget {
  final List<InforCardHorizontal> peliculas;
  final Function siguientePagina;

  CardHorizontal({Key? key, required this.peliculas, required this.siguientePagina}) : super(key: key);

  final _pageController = PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: screenSize.height * 0.25,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: false,
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return _crearTarjeta(context, peliculas[index]);
        },
      ),
    );
  }

  Widget _crearTarjeta(BuildContext context, InforCardHorizontal info) {
    return SingleChildScrollView(
      child: Container(
        margin:  EdgeInsets.only(right: 25.0),
        width: 160.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(
                placeholder: const AssetImage('assets/icon-image-not-found-free-vector.jpg'),
                image: AssetImage(info.imageUrl),
                fit: BoxFit.cover,
                height: 170.0,
              ),
            ),
             SizedBox(height: 5.0),
            Text(
              info.titulo,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
