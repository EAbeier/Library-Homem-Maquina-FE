import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homem_maquina_library/modules/book/controller/register_edit_book_controller.dart';

class EditBookPage extends StatelessWidget {
  const EditBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterEditBookController>(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Homem Máquina Library - New Book'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctx.titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Book Title',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'You need to fill this field!';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctx.dataController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Publishing Date',
                        prefixIcon: Icon(Icons.calendar_today),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        )),
                    readOnly: true,
                    onTap: () {
                      ctx.selectDate();
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          decoration:
                              const InputDecoration(label: Text('Author')),
                          items: ctx.authors,
                          onChanged: (value) {
                            ctx.setAuthor(value);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          decoration:
                              const InputDecoration(label: Text('Genre')),
                          items: ctx.genres,
                          onChanged: (value) {
                            ctx.setGenre(value);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            try {
                              ctx.save(context);
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          child: const Text('Register Book'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
