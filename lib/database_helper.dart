import 'dart:io';

import 'package:sqflite/sqlite_api.dart';

class DataBaseHelper{

  DataBaseHelper . _priveContractor();

  static final DataBaseHelper instance=DataBaseHelper._priveContractor();

  Database ?_database;

  Future<Database>get database=>_database ??= initailize;
}

