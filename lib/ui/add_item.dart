import 'package:flutter/material.dart';
import 'package:lista_compras/models/item.dart';

class AddItem extends StatelessWidget {

  final itemC = TextEditingController();

  AddItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('add Item', style: TextStyle(color: Colors.greenAccent),),  
      content: TextField(
        style: const TextStyle(color: Colors.greenAccent ),
        autofocus: true,
        controller: itemC,
        cursorColor: Colors.greenAccent,
      ),
      actions: <Widget>[
        TextButton(    
          onPressed: () {
            final item = Item(title: itemC.value.text);
            itemC.clear();
            Navigator.of(context).pop(item);
          },
          child: const Text('Add'),
        ),
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar', style: TextStyle(color: Colors.blueGrey),)),
      ],
    );
  }
}