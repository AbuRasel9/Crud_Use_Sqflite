import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final mobileController=TextEditingController();
  final addressController=TextEditingController();
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
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                controller: nameController,
                validator: (String ?value){
                  return "Enter Name";
                },
                decoration: buildInputDecoration("Enter Name"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: addressController,
                validator: (String ?value){
                  return "Enter Address";
                },
                decoration: buildInputDecoration("Enter Email Address"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                validator: (String ?value){
                  return "Enter Email";
                },
                decoration: buildInputDecoration("Enter Email Address"),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: nameController,
                validator: (String ?value){
                  return "Enter Phone";
                },
                decoration: buildInputDecoration("Enter Phone number"),
              ),

              SizedBox(height: 20,),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                      onPressed: (){

                  }, child: Text("Submit")))
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
