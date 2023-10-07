import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'model/notes_model.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({super.key});

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  @override
  void initState() {
    setState(() {});
    notes.get(); // TODO: implement initState
    super.initState();
  }

  //modalBottomSheet
  Widget buildBottomWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom), // viewInsets.bottom checks
          // the size of the obscured area by keyboard or other layout, leaves space for that
          // and take container's bottom where keyboard starts from.
          child: const AddTaskScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.lightBlueAccent.shade200,
                    )),
                const SizedBox(height: 10),
                const Text(
                  'todoeys',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                const Text(
                  '12 tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: FutureBuilder<QuerySnapshot>(
                  future: notes.get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: Text(
                        'Plase click on \'+\' button to add a task',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ));
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text(
                        'Error',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            ///===method 1===///
                            QueryDocumentSnapshot notesData =
                                snapshot.data!.docs[index];

                            ///===or Method 2===///
                            var everyDocumentDataInNoteModel =
                                NoteModel.fromJson(snapshot.data!.docs[index]
                                    .data() as Map<String, dynamic>);

                            ///===or amended method 2===///
                            var throughQueryDocumentSnapshotInside =
                                NoteModel.fromJson(
                                    notesData.data() as Map<String, dynamic>);
                            return Card(
                              shadowColor: Colors.lightBlueAccent.shade100,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  notesData['task'], // method 1
                                ),
                                subtitle: Text(everyDocumentDataInNoteModel
                                    .task), // method 2

                                // trailing: Checkbox(
                                //   value: false,
                                //   onChanged: (bool? value) {},
                                // ),
                              ),
                            );
                          });
                    } else {
                      return Container(
                        child: Text('last wala else in a container'),
                      );
                    }
                  }),
            ),

            //
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: buildBottomWidget);
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
