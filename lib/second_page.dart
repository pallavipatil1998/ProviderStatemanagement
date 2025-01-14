import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_provider/counter_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("SecondPAGE",style: TextStyle(fontSize: 30,color: Colors.white),)),backgroundColor: Colors.green,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times",style: TextStyle(fontSize: 15),),
            // Text("${Provider.of<CounterProvider>(context).getcount()}",style: TextStyle(fontSize: 40),),
            Text("${context.watch<CounterProvider>().getcount()}",style: TextStyle( fontSize: 30),)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: (){
              // Provider.of<CounterProvider>(context,listen: false).increment();
              context.read<CounterProvider>().increment();
            },
            child: Icon(Icons.add,size: 35,),
            tooltip: "Increment",
          ),
          FloatingActionButton(
            onPressed: (){
              // Provider.of<CounterProvider>(context,listen: false).decrement();
              context.read<CounterProvider>().decrement();
            },
            child: Icon(Icons.remove,size: 35,),
            tooltip: "Decrement",
          ),
        ],
      ),
    );
  }
}
