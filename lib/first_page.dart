import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_provider/counter_provider.dart';
import 'package:statemanagement_provider/list_provider.dart';
import 'package:statemanagement_provider/second_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  var nameController=TextEditingController();
  var classController= TextEditingController();


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
                  onTap: (){
                    nameController.text=data[index]["Name"];
                    classController.text=data[index]["Class"];
                    showModalBottomSheet(
                        context: context,
                        builder:(_){
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Update Dta",style: TextStyle(fontSize: 25),),
                            TextField(
                              controller: nameController,
                              ),
                            TextField(
                              controller: classController,
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  var updatedData={
                                    "Name":nameController.text.toString(),
                                    "Class":classController.text.toString(),
                                  };
                                  context.read<ListProvider>().updateListData(updatedData, index);
                                  Navigator.pop(context);
                                },
                                child: Text("Update",style: TextStyle(fontSize: 20),)
                            )

                          ],
                        ),
                      );
                        }
                    );
                  },


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
           showModalBottomSheet(
               context: context,
               builder: (_){
                 return Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Text("ADD data"),
                       TextField(
                         controller: nameController,
                       ),
                       TextField(
                         controller: classController,
                       ),
                       ElevatedButton(
                           onPressed: (){
                             var addData={
                               "Name": nameController.text.toString(),
                               "Class":classController.text.toString()
                             };
                             context.read<ListProvider>().addListData(addData);
                             Navigator.pop(context);
                           },
                           child: Text("Add",style: TextStyle(fontSize: 20),)
                       )


                     ],
                   ),
                 );
               }
           );

          },
        child: Icon(Icons.add),
      )
    );

  }
}
