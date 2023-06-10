import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mind_mosaic1/view_models/app_view_model.dart';

import '../../models/task_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
            height: 80,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 250,
                child: TextField(
                    onSubmitted: (value) {
                      if (entryController.text.isNotEmpty) {
                        Task newTask = Task(entryController.text, false);
                        viewModel.addTask(newTask);
                        entryController.clear();
                      }
                      Navigator.of(context).pop();
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 5),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none))),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Color.fromARGB(255, 153, 128, 177),
                    autofocus: true,
                    autocorrect: false,
                    controller: entryController,
                    style: TextStyle(
                        color: Color.fromARGB(255, 27, 18, 36),
                        fontWeight: FontWeight.w500)),
              ),
            )),
      );
    });
  }
}
