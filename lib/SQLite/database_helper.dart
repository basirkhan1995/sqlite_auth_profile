
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Json/users.dart';

class DatabaseHelper{
  String databaseName = "auth.db";

  //SQLite table for login and sign up
  String users = '''
  CREATE TABLE users (
  usrId INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT,
  email TEXT,
  usrName TEXT UNIQUE,
  usrPassword TEXT
  )
   ''';


  //Our Connection is complete
  Future<Database> initDB ()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path,version: 1,onCreate: (db,version)async{
      //Here we run the query to create the table
     await db.execute(users);
    });
  }

  //Method for login
  Future<bool> authenticate (Users users) async{
    final Database db = await initDB();
    var res = await db.rawQuery("select * from users where usrName = '${users.usrName}' AND usrPassword ='${users.usrPassword}' ");
    if(res.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  //Sign up
  Future<int> createUser(Users users)async{
    final Database db = await initDB();
    return db.insert('users', users.toMap());
  }

  //Get current User after login
 Future<Users?> getUser(String username)async{
    final Database db = await initDB();
    var res = await db.query("users",where: "usrName = ?",whereArgs: [username]);
    return res.isNotEmpty? Users.fromMap(res.first):null;
 }

 //Check User Exist, if there is duplicate user, we catch the exception and show a message
 Future<bool> checkUserExist(String username)async{
    final Database db = await initDB();
    final List<Map<String,dynamic>> res = await db.query("users",where: "usrName = ?", whereArgs: [username]);
    return res.isNotEmpty;
  }


}