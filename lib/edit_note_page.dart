import 'package:flutter/material.dart';
import 'package:flutter_to_do_list15092021/note_model.dart';
class EditNotePage extends StatefulWidget {

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late var arguments;
  late NoteModel noteModel;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as Map;
    noteModel = arguments['noteModel'];

    titleController.text = noteModel.title;
    descriptionController.text = noteModel.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
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
              controller: descriptionController,
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

              var title = titleController.text;
              var description = descriptionController.text;

              if (title.isNotEmpty && description.isNotEmpty){
                noteModel.title = title;
                noteModel.description = description;
                arguments['update'](noteModel);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Them thanh cong")));
                Future.delayed(Duration(seconds: 1), (){
                  Navigator.pop(context);
                });
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Du lieu chua day du")));
                return;
              }

            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
