import 'package:counter/screens/counter_screen.dart';

import 'package:flutter/material.dart';

// funcion que se ejecutará por defecto en un proyecto de dart
void main() {
  // ejecutamos nuestro widget principal
  runApp(const App());
}

//declaro la clase de mi widget principal, hereda de la clase estandar
// de widget sin estado
class App extends StatelessWidget {
  const App({super.key});

  // sobreescribo el metodo build de su clase parent
  // este metodo recibe un contexto, que es su posicion en el arbol
  // el metodo build devuelve un Widget
  @override
  Widget build(BuildContext context) {
    // el widget que devuelve es un estandar con material design
    return const MaterialApp(
      // declaramos la propiedad home y le asignamos nuestro widget de contador
      home: CounterScreen(),
    );
  }
}
