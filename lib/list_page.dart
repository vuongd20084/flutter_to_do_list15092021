import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_do_list15092021/add_note_page.dart';
import 'package:flutter_to_do_list15092021/edit_note_page.dart';
import 'package:flutter_to_do_list15092021/note_model.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // global of state object
  final List<NoteModel> listNoteModels = [];

  void insertNoteModel(NoteModel noteModel){
    setState(() {
      listNoteModels.add(noteModel);
    });
  }

  void updateNoteModel(NoteModel noteModel){
    setState(() {
      listNoteModels.forEach((element) {
        if (element.id == noteModel.id){
          element = noteModel;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddNotePage(),
                settings: RouteSettings(
                    arguments: {
                      "insert" : insertNoteModel,
                    }
                )
            ));
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(height: 5);
            },
            itemCount: listNoteModels.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EditNotePage.initModel(editNoteModel: updateNoteModel, noteModel: listNoteModels[index])));
                },
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(listNoteModels[index].title, overflow: TextOverflow.ellipsis),
                    leading: Text((index + 1).toString() , textAlign: TextAlign.center,),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {

                      },
                    ),
                    subtitle: Text(listNoteModels[index].description , overflow: TextOverflow.ellipsis),
                    minLeadingWidth: 10,
                  ),
                ),
              );
            }),
      ),
    );
  }
}