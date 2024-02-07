import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_example/database_help/database_helper.dart';
import 'package:sqflite_example/database_helper.dart';

class SqfLiteExample extends StatefulWidget {

  const SqfLiteExample({super.key});

  @override
  State<SqfLiteExample> createState() => _SqfLiteExampleState();
}

class _SqfLiteExampleState extends State<SqfLiteExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqfLite"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,


            children: [

              CupertinoButton(
                color: Colors.red,
                  child: Text("Insert"), onPressed: () async{
                 int i =  await DatabaseHelper.instance.insert({
                    DatabaseHelper.columnId: "Fazal"

                  });
                 print('the insert id$i ');
              }),
              SizedBox(height: 10,),
              CupertinoButton(
                  color: Colors.black,
                  child: Text("Qurey"), onPressed: ()async{
                    List<Map<String,dynamic>> record1= await DatabaseHelper.instance.queryAll();
                    print(record1);

              }),
              SizedBox(height: 10,),
              CupertinoButton(
                color: Colors.black,
                  child: Text("Delete"), onPressed: ()async{
                  int rowdelete= await DatabaseHelper.instance.delete(13);
                  print(rowdelete);


              }),
              SizedBox(height: 10,),
              CupertinoButton(
                color: Colors.amberAccent,
                  child: Text("Update"), onPressed: () async{
                  int updateid= await DatabaseHelper.instance.update({
                    DatabaseHelper.columnId : 12,
                    DatabaseHelper.columnName : "abc"

                  });
                  print(updateid);

              })
            ],
          ),
        ),
      ),
    );
  }
}
