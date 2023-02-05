import 'package:flutter/material.dart';
import 'package:flutter03_delivery/models/api_response.dart';
import 'package:flutter03_delivery/pages/registro/provider/registro_provider.dart';
import 'package:flutter03_delivery/widgets/back_button.dart';
import 'package:flutter03_delivery/widgets/button_widget.dart';
import 'package:flutter03_delivery/widgets/input_widget.dart';
import 'package:flutter03_delivery/widgets/stack_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidosCtrl = TextEditingController();
  TextEditingController telefonoCtrl = TextEditingController();

  bool disabled = false;

  @override
  Widget build(BuildContext context) {
    return StackWidget(
      backButton: backButton(Colors.white, context),
      img: 'assets/images/fondo-Welcome.jpeg',
      altoContenedor: 0.8, //parte escondido, pero lo blanco es más grande
      altoImg: 0.4,
      widgets: [
        Text(
          'Registro',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        InputWidget(
            hint: 'Nombre',
            marginTop: 10,
            paddingLeft: 20,
            textCtrl: nombreCtrl),
        InputWidget(
            hint: 'Apellidos',
            marginTop: 10,
            paddingLeft: 20,
            textCtrl: apellidosCtrl),
        InputWidget(
            hint: 'Telefono',
            marginTop: 10,
            paddingLeft: 20,
            textCtrl: telefonoCtrl,
            keyboardType: TextInputType.phone),
        InputWidget(
            hint: 'Email', marginTop: 10, paddingLeft: 20, textCtrl: emailCtrl),
        InputWidget(
          hint: 'Contraseña',
          marginTop: 10,
          paddingLeft: 20,
          textCtrl: passwordCtrl,
          obscure: true,
        ),
        ButtonWidget(marginTop: 40,
            texto: 'Crear cuenta',
            ancho: 0.4,
            alto: 0.05,
            onClick: (){
          _registrarUsuario();
        })
          ]
    );
  }

  _registrarUsuario() async {
    setState(() {
      disabled = true;
    });

    Map<String,dynamic> cliente = {
      'user':{
        'email': emailCtrl.text,
        'password': passwordCtrl.text,
      },
      'role': 'ROLE_CLIENTE',
      'cliente': {
        'nombre': nombreCtrl.text,
        'apellidos': apellidosCtrl.text,
        'telefono': telefonoCtrl.text,
      }
    };

    //Lamar a la api y enviarle el cliente
    RegistroService registroService = RegistroService();
    ApiResponse apiResponse = await registroService.registroUser(cliente);
    if(!apiResponse.error){
      Navigator.pop(context);
    } else{
      //Mostrar un mensaje diciendo que ha ocurrido un error
      Fluttertoast.showToast(msg: apiResponse.apiErrorMessage);
    }
    setState(() {
      //Acttivamos de nuevo el botón
      disabled = false;
    });
  }
}
