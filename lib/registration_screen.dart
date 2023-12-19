import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:registration_screen/data_screen.dart';
import 'package:registration_screen/database_helper.dart';
import 'package:registration_screen/database_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Registration Screen"),
      ),
      body: Padding(
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
                controller: mobileController,
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
                          await DataBaseHelper.instance.addTask(crudData);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add successfully")));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DataScreeen()));
                        }, child: Text("Submit")),
                  ),


                ],
              ),


            ],
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
