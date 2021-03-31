import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // TextEditingController nombreTextController;
  //TextEditingController apTextController;

  FocusNode nombreFocus;
  FocusNode apellidoFocus;
  FocusNode edadFocus;

  String nombre;
  String apellido;
  String edad;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Formulario Link'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Ejemplo: Alain Link',
                      prefixIcon: Icon(Icons.account_circle)),
                  onSaved: (value) {
                    nombre = value;
                  },

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no puede estar vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.nombreFocus,
                  onEditingComplete: () => requestFocus(context, apellidoFocus),
                  textInputAction: TextInputAction.next,
                  // autofocus: true,
                  // controller: nombreTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Apellido',
                      hintText: 'Ejemplo: Hero',
                      prefixIcon: Icon(Icons.person_add)),
                  onSaved: (value) {
                    apellido = value;
                  },

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no puede estar vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.apellidoFocus,
                  onEditingComplete: () => requestFocus(context, edadFocus),
                  textInputAction: TextInputAction.next,
                  //   autofocus: true,
                  //   controller: apTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Edad',
                      hintText: 'Ejemplo: 22',
                      prefixIcon: Icon(Icons.bubble_chart_outlined)),
                  onSaved: (value) {
                    edad = value;
                  },

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no puede estar vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.edadFocus,
                  //   autofocus: true,
                  //   controller: apTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (nombre.compareTo('Alain Link') == 0 &&
                            apellido.compareTo('Hero') == 0) {
                          Navigator.pushNamed(context, 'formulario_dos',
                              arguments: Argumentos(
                                  nombre: this.nombre,
                                  apellido: this.apellido,
                                  edad: this.edad));
                        }
                      } else {
                        print('Datos incorrectos');
                      }
                    },
                    child: Text('Enviar')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //String validarCampo(var valor) {
  //  if (valor.isEmpty) {
  //    return 'Este campo no puede quedar vacio';
  //   }
//  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void initState() {
    super.initState();
    //nombreTextController = TextEditingController();
    //apTextController = TextEditingController();
    nombreFocus = FocusNode();
    apellidoFocus = FocusNode();
    edadFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    // nombreTextController.dispose();
    // apTextController.dispose();
    nombreFocus.dispose();
    apellidoFocus.dispose();
    edadFocus.dispose();
  }
}

class Argumentos {
  String nombre;
  String apellido;
  String edad;

  Argumentos({this.nombre, this.apellido, this.edad});
}
