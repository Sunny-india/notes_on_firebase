import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app_on_firebase/model/notes_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // took container in a container
    // to show the border radius of
    // modalBottomSheet over there.
    // the parent container has a color
    // matching with that task page over there.
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
              ),
              TextFormField(
                controller: taskController,
                // autofocus:
                //     isClicked ? false : true, // automatically shows keyboard
                textAlign:
                    TextAlign.center, // to grab cursor attention to center
                validator: (value) {
                  if (value != '') {
                    return null;
                  } else {
                    return 'Please enter some value';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              isClicked == true
                  ? const Center(child: CircularProgressIndicator())
                  : MaterialButton(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isClicked = true;
                          });
                          print('Done');
                          FirebaseFirestore firestore =
                              FirebaseFirestore.instance;
                          firestore
                              .collection('notes')
                              .add(NoteModel(
                                          task: taskController.text.toString())
                                      .toJson()
                                  //     {
                                  //   'task': taskController.text.toString(),
                                  // }

                                  )
                              .whenComplete(() {
                            setState(() {
                              formKey.currentState!.reset();
                              taskController.clear();
                              isClicked = false;
                              Navigator.pop(context);
                            });
                          });
                        }
                      },
                      child: const Text(
                        'Add your Task',
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
