import 'package:app_prac/src/pages/billetera_page.dart';
import 'package:app_prac/src/pages/botones_page.dart';
import 'package:app_prac/src/pages/formulario_page.dart';
import 'package:app_prac/src/pages/fotos_page.dart';
import 'package:app_prac/src/pages/home_page.dart';
import 'package:app_prac/src/pages/lugares_page.dart';
import 'package:app_prac/src/pages/mapa_page.dart';
import 'package:app_prac/src/pages/podcast_page.dart';
import 'package:app_prac/src/pages/secondFormPage_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> obtenerRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'mapa': (BuildContext context) => MapaPage(),
    'billetera': (BuildContext context) => BilleteraPage(),
    'fotos': (BuildContext context) => FotoPage(),
    'lugares': (BuildContext context) => LugarPage(),
    'podcast': (BuildContext context) => PodcastPage(),
    'formulario': (BuildContext context) => FormPage(),
    'formulario_dos': (BuildContext context) => SecondFormPage()
  };
}
