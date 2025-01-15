import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_provider/counter_provider.dart';
import 'package:statemanagement_provider/list_provider.dart';
import 'package:statemanagement_provider/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("home buid ");
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("FIRSTPAGE",style: TextStyle(fontSize: 30,color: Colors.white),)),backgroundColor: Colors.purpleAccent,),
      body: Consumer<ListProvider>(
          builder:(_,Provider,___){
            List<Map<String,dynamic>> data=  Provider.getListData();
            return ListView.builder(
              itemCount: data.length,
                itemBuilder: (ctx ,index){
                return InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text("${data[index]["Name"]}"),
                      subtitle: Text("${data[index]["Class"]}"),
                      trailing: InkWell(
                        onTap: (){
                          Provider.deleteListData(index);
                        },
                          child: Icon(Icons.delete,)
                      ),
                    ),
                  );
                }
            );
          }
      ),





      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Map<String,dynamic> newData={
              "Name": "Pallavi",
              "Class": "x"
            };
            context.read<ListProvider>().addListData(newData);
          },
        child: Icon(Icons.add),
      )
    );

  }
}
