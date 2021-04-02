import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_prac/src/models/random_people_model.dart';
import 'dart:convert';

class Api_PeopleRandom extends StatefulWidget {
  const Api_PeopleRandom({Key key}) : super(key: key);
  @override
  _Api_PeopleRandomState createState() => _Api_PeopleRandomState();
}

class _Api_PeopleRandomState extends State<Api_PeopleRandom> {
  Future<List<People>> _listaPersonas;

  Future<List<People>> _obtenerPersonas() async {
    List<People> persons = [];
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=20'));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      for (var item in jsonData['results']) {
        persons.add(People(
            name: item['name']['first'],
            last_name: item['name']['last'],
            picture: item['picture']['large'],
            email: item['email'],
            edad: item['dob']['date']));
      }
    } else {
      throw Exception('Fallo la llamada a la API');
    }
    return persons;
  }

  @override
  void initState() {
    super.initState();
    _listaPersonas = _obtenerPersonas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos de Alain Link'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _listaPersonas,
          initialData: List<People>.empty(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 1,
                children: _listadoPersonas(snapshot.data),
              );
            } else if (snapshot.error) {
              print(snapshot.error);
              return Text('Error al conectar a la API');
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _listadoPersonas(List<People> data) {
    List<Widget> personList = [];

    for (var person in data) {
      personList.add(Card(
        child: Column(
          children: [
            CircleAvatar(
              radius: 130,
              backgroundImage: NetworkImage(person.picture),
            ),
            Text(
              'Nombre: ' + person.name + ' ' + person.last_name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Email: ' + person.email,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(
              'Fecha nacimiento: ' + person.edad,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ));
    }
    return personList;
  }
}
