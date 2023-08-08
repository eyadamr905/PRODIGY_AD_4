import 'package:sqflite/sqflite.dart'; 

 import 'package:tic_tac_toe/multi_player.dart';
import 'package:tic_tac_toe/vs_computer.dart'; 

 class MyDatabase{ 
   static late Database database; 
  late String firstPlayerName;
  late String secondPlayerName;
  late int W_Num;

   static Future<void> initliazeDatabase()async{ 
      String path = await getDatabasesPath(); 
      path =  path + 'database.db'; 

      database = await openDatabase( 
        path, 
        version: 1, 

        onCreate: (database,version)async{ 
          print('Database is Created'); 
           await database.execute('CREATE TABLE Players(name TEXT  ,P_ID INTEGER NOT NULL ,W_Num IN)').then((value){ 

            print('table is created successfully'); 

          }).catchError((error){ 
            print(error.toString()); 
          }); 

        }, 

        onOpen: (datebase){ 
          print('database is opend'); 

      }, 

      ); 

   } 

   static Future<void> insertIntoDatabase({ 
     required String firstPlayerName,
     required String secondPlayerName,
     
      

 })async{ 

     database.rawInsert('INSERT INTO players(name, name) VALUES ()',[firstPlayerName,secondPlayerName]).then((value) { 
       print('${value} is inserted successfully'); 
     }).catchError((error){ 
       print(error.toString()); 
     }); 

   } 

 

 }
 