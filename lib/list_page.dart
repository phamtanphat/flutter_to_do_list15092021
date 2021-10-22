import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // global of state object
  final List<String> listLanguage = [
    "Java",
    "Dart",
    "PHP",
    "Python",
    "Javascript"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
        actions: [
          IconButton(onPressed: (){
            
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 5);
            },
            itemCount: listLanguage.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: ListTile(
                  title: Text(listLanguage[index] + " language"),
                  leading: Text((index + 1).toString() , textAlign: TextAlign.center,),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  ),
                  subtitle: Text("Description"),
                  minLeadingWidth: 10,
                ),
              );
            }),
      ),
    );
  }
}
