
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  VoidCallback onClick; //es una función de vuelta
  bool disabled;
  double ancho;
  double alto;
  double marginTop;
  String texto;

  ButtonWidget(
      {super.key,
      required this.marginTop,
      required this.texto,
      required this.ancho,
      required this.alto,
      required this.onClick,
      this.disabled = false});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var anchoP = MediaQuery.of(context).size.width;
    var altoP = MediaQuery.of(context).size.height;

    return Container(
      width: anchoP * widget.ancho,
      height: altoP * widget.alto,
      margin: EdgeInsets.only(top: widget.marginTop),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: widget.disabled
            ? null
            : () {
              // Quiero comprobar las variables
              // Devolver una funcion vacia que rellena el padre
              //de tal manera que no es el propio boton el que la gestiona
              //si no el padre
                widget.onClick();
              },
              child: Text(widget.texto),
      ),
    );
  }
}
