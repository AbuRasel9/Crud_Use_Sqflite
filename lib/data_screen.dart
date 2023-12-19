import 'package:flutter/material.dart';
import 'package:registration_screen/database_helper.dart';
import 'package:registration_screen/database_model.dart';
import 'package:registration_screen/registration_screen.dart';
import 'package:registration_screen/update_screen.dart';

class DataScreeen extends StatefulWidget {
  const DataScreeen({super.key});

  @override
  State<DataScreeen> createState() => _DataScreeenState();
}

class _DataScreeenState extends State<DataScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Data Screen"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));},
        ),

        body: FutureBuilder(
          future: DataBaseHelper.instance.getData(),

          builder: ( context, snapshot) {

            if(snapshot.hasData){
              return  ListView(
                  children:  snapshot.data!.map((CrudModel value){
                    return  ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.name!,),
                          SizedBox(height: 2,),
                          Text(value.email!,),
                          SizedBox(height: 2,),
                          Text(value.address!,),
                          SizedBox(height: 2,),
                          Text(value.phone
                          !,),
                        ],
                      ),
                      leading:IconButton(onPressed: () async {
                        await DataBaseHelper.instance.deleteData(value.id!);
                        setState(() {

                        });


                      }, icon: Icon(Icons.delete),),
                      trailing: IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateScreen(crudModel: value,


                        )));



                      },icon: Icon(Icons.edit),),
                    );
                  }).toList()
              );
            }
            return Center(child: CircularProgressIndicator());

          },

        ));
  }
}
