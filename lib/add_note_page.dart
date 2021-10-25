import 'package:flutter/material.dart';
class AddNotePage extends StatefulWidget {

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                hintText: "Title",
                prefixIcon: Icon(Icons.description),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 4,
              maxLength: 150,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                hintText: "Description",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){


            }, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
