import 'package:flutter/material.dart';

import 'package:lista_compras/ui/list_screem.dart';

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lista de Compras',
      home: ListScreem(),
    );
  }
}