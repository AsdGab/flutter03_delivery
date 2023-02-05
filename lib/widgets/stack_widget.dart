import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  List<Widget> widgets;
  double altoImg;
  double altoContenedor;
  String img;
  Widget backButton;

  StackWidget(
      {super.key,
      required this.widgets,
      this.altoImg = 0.5,
      this.altoContenedor = 0.5,
      required this.img,
      this.backButton = const SizedBox() //no hace nada
      });

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;

    return Scaffold(
      //El SingleChildScrollView para hacer que todo el cuerpo sea scrolleable
      body: SingleChildScrollView(
        physics:
            const AlwaysScrollableScrollPhysics(), //que haga scrill donde el usuario quiera
        child: Column(
          children: [
            // Widget para poner una cosa encima de la otra
            Stack(
              children: [
                Image(
                  width: double.infinity,
                  height: alto * altoImg,
                  fit: BoxFit.cover,
                  image: AssetImage(img),
                ),
                Container(
                  //Albergar un boton para navegar atrás
                  margin: EdgeInsets.only(top: 50.0),
                  child: backButton,
                )
              ],
            ),
            //Widget que modifica la posicion de su hijo
            Transform.translate(
              offset: Offset(0, -50),
              // va a contener mis inputs de login
              child: Container(
                width: double.infinity,
                height: alto * altoContenedor,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: widgets, //donde va toda mi información
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
