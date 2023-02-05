import 'package:flutter/material.dart';
import 'package:flutter03_delivery/utils/colors/colors.dart';
import 'package:flutter03_delivery/widgets/button_widget.dart';
import 'package:flutter03_delivery/widgets/input_widget.dart';
import 'package:flutter03_delivery/widgets/stack_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    bool disabled = false;

    // Devolvía el ancho de la pantalla
    return StackWidget(img: 'assets/images/login-fondo.jpeg', widgets: [
      const Text(
        'Bienvenido',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
      ),
      const Text(
        'Accede a tu cuenta',
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13.0),
      ),
      InputWidget(
        hint: 'Email',
        marginTop: 40,
        paddingLeft: 20,
        textCtrl: emailCtrl,
        keyboardType: TextInputType.emailAddress,
      ),
      InputWidget(
        hint: 'Contraseña',
        marginTop: 10,
        paddingLeft: 20,
        textCtrl: passwordCtrl,
        obscure: true,
      ),
      //Boton de login
      ButtonWidget(
          marginTop: 30,
          texto: 'Entrar',
          ancho: 0.5,
          alto: 0.05,
          disabled: disabled,
          onClick: () {
            _loginUser();
          }),
      Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Aun no tienes cuenta? ',
              style: TextStyle(
                  color: gris, fontWeight: FontWeight.w500, fontSize: 15),
            ),
            GestureDetector(
              onTap: () {
                //Navegar a la pagina de registro
                Navigator.of(context).pushNamed('/registro');
              },
              child: const Text(
                'Registro',
                style: TextStyle(
                    color: amarillo,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
              ),
            )
          ],
        ),
      )
    ]);
  }

  void _loginUser() {}
}
