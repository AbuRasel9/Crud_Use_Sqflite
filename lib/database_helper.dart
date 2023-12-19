import 'dart:io';

import 'package:registration_screen/database_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

//
// class DataBaseModel {
//
//   DataBaseModel._privateInstance();
//
//   static DataBaseModel instance = DataBaseModel._privateInstance();
//   static Database? _database;
//
//   Future<Database> get database async => _database ?? await initDataBase();
//
//
// // initial database
//   Future<Database> initDataBase() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentDirectory.toString(),"cruds.db");
//     return await openDatabase(
//         path,
//         version: 1,
//         onCreate: _onCreate
//     );
//   }
//   Future _onCreate(Database db,int version) async {
//     return await db.execute("""
//       CREATE TABLE crud(
//         id INTEGER PRIMARY KEY,
//         name TEXT,
//         email TEXT,
//         phone TEXT,
//         address TEXT,
//       )
//
//
//       """
//
//
//     );
//   }
//
// }

class DataBaseHelper{
  DataBaseHelper ._privateInstance();
  static DataBaseHelper instance=DataBaseHelper._privateInstance();
  static Database ?_database;
  //check database create or not
  Future<Database>get database async =>  _database ??await intitDataBase();

  Future<Database> intitDataBase() async {
    Directory documetDirectory=await getApplicationDocumentsDirectory();
    String path=join(documetDirectory.path.toString(),"crudss.db");
    return await openDatabase(path,version: 1,onCreate: _onCreate);


  }
  //create table
  Future _onCreate(Database db,int version) async {
    return await db.execute("""
      CREATE TABLE crud(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        address TEXT,
        email TEXT,
        phone TEXT
        
      )
      
      """
    );
  }

  //insert data
  Future addTask(CrudModel crudModel) async {
    Database db=await DataBaseHelper .instance.database;
    return await db.insert("crud", crudModel.toJson());
  }

  //get data
  Future <List<CrudModel>>getData() async {
    Database db=await DataBaseHelper.instance.database;
    var data=await db.query("crud",orderBy: "id");
    List<CrudModel> dataList=await data.isNotEmpty ? data.map((value) =>CrudModel.fromJson(value) ).toList() :[];
    return dataList;

  }

  //delete data
  Future deleteData(int id) async {
    Database db=await DataBaseHelper.instance.database;
    return await db.delete("crud",where: "id= ?",whereArgs: [id]);

  }

  //update data
  Future updateData(CrudModel crudModel,int id)async{
    Database db=await DataBaseHelper.instance.database;
    return await db.update("crud", crudModel.toJson(),where: "id = ?",whereArgs: [id]);
  }






}
