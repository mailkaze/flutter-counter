import 'package:flutter/material.dart';

// declaro la clase de mi widget con estado
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  // no sobreescribe el metodo constructor sino la declaracion de su state
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

// a continuación una clase abstracta del mismo nombre contiene el widget
class _CounterScreenState extends State<CounterScreen> {
  // declaro mis variables y funciones, o propiedades y metodos, de esta clase
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  // ahora sí, sobreescribo el metodo build
  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    // devuelvo el widget estandar scaffold, un esqueleto prediseñado
    // que contiene barra de navegacion, body y un botón flotante
    return Scaffold(
      // a cada uno de sus elementos estandar le asigno un Widget
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 4,
      ),
      // column y row, a diferencia de la mayoria, recibe children en vez de child,
      // lo que significa que puede contener varios widgets en un array
      body: Column(children: [
        const MiTexto(),
        const Text(
          'Touch counter',
          style: fontSize30,
        ),
        Text('$counter', style: fontSize30)
      ]),
      // al boton flotante le asigno un widget custom mio:
      floatingActionButton: CustomFloatingActions(
        decreaseFn: decrease,
        increaseFn: increase,
        resetFn: reset,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// declaro mi propio widget de botonera, sin estado
class CustomFloatingActions extends StatelessWidget {
  // para ser instanciado, tiene una serie de propiedades obligatorias
  // de tipo funcion
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  // se inclyen las funciones en su constructor
  const CustomFloatingActions(
      {super.key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetFn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.zoom_out_sharp),
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.zoom_in_map),
        ),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.zoom_out_rounded),
        )
      ],
    );
  }
}

class MiTexto extends StatelessWidget {
  const MiTexto({super.key});

  @override
  Widget build(BuildContext context) {
    const textContent = 'hola, soy un widget aparte!';
    const textStyle = TextStyle(
        backgroundColor: Colors.amber, fontSize: 40, color: Colors.pinkAccent);

    return const Text(
      textContent,
      style: textStyle,
    );
  }
}
