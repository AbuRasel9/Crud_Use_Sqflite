
import 'package:flutter/material.dart';
import 'package:registration_screen/data_screen.dart';
import 'package:registration_screen/database_helper.dart';
import 'package:registration_screen/database_model.dart';

class UpdateScreen extends StatelessWidget {
final  CrudModel crudModel;
   UpdateScreen({super.key, required this.crudModel});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final mobileController = TextEditingController();

  final addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();




  @override

  Widget build(BuildContext context) {

    nameController.text=crudModel.name!;
    emailController.text=crudModel.email!;
    addressController.text=crudModel.address!;
    mobileController.text=crudModel.phone!;



    return Scaffold(




      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Registration Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextFormField(
                  controller: nameController,
                  validator: (String ?value) {
                    return "Enter Name";
                  },
                  decoration: buildInputDecoration("Enter Name"),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: addressController,
                  validator: (String ?value) {
                    return "Enter Address";
                  },
                  decoration: buildInputDecoration("Enter  Address"),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  validator: (String ?value) {
                    return "Enter Email";
                  },
                  decoration: buildInputDecoration("Enter Email Address"),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: nameController,
                  validator: (String ?value) {
                    return "Enter Phone";
                  },
                  decoration: buildInputDecoration("Enter Phone number"),
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                          onPressed: () async {
                            final crudData = CrudModel(
                                name: nameController.text,
                                address: addressController.text,
                                email: emailController.text,
                                phone: mobileController.text);
                            await DataBaseHelper.instance.updateData(crudData,crudModel.id!.toInt());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DataScreeen()));


                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add successfully")));
                          }, child: Text("Update")),
                    ),


                  ],
                ),


              ],
            ),

          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String text) {
    return InputDecoration(
        fillColor: Colors.greenAccent,
        filled: true,
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        )
    );
  }
}
