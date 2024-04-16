import 'package:flutter/material.dart';

import 'package:lista_compras/models/item.dart';
import 'package:lista_compras/ui/add_item.dart';

class ListScreem extends StatefulWidget {
  const ListScreem({super.key});


  @override
  State<ListScreem> createState() => _ListScreemState();
}

class _ListScreemState extends State<ListScreem> {
  List<Item> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        

      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.separated(
        itemBuilder: (context, index){
          final item = items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: IconTheme(
                data: const IconThemeData(
                  color: Colors.white
                ),
                child: Icon(
                  item.isDone ? Icons.done_all : Icons.done
                ),
              ),
            ),
            title: Text(item.title, style: const TextStyle(color:Colors.greenAccent),),
            onTap: (){
              setState(() {
                items[index].isDone = !items[index].isDone;                
              });
            },
          );
        }, 
        separatorBuilder: (context, index)=> const Divider(color: Colors.blueGrey,), 
        itemCount: items.length
      ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        foregroundColor: Colors.white,
        onPressed: _addItem ,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _addItem() async {
    final item = await showDialog<Item>(
      context: context, 
      builder: (BuildContext context){
        return AddItem();
      }
    );
    if(item != null){
      setState(() {
        items.add(item);
        
      });

    }

  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      items.sort((a,b){
        if(a.isDone && !b.isDone) {
          return 1;
        } else if(!a.isDone && b.isDone) return -1;
        return 0;
      });
      
    });
    return Future.value();
  }
}