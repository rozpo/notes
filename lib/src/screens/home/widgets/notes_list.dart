import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../../models/note.dart';
import '../../../services/notes_service.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: NotesService.listen(),
      builder: (context, box, child) {
        return ListView.separated(
          reverse: true,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: box.length,
          itemBuilder: (context, index) {
            Note note = NotesService.read(index);
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  note.content,
                  textAlign: TextAlign.center,
                ),
              ),
              subtitle: Text(
                DateFormat.yMMMMd()
                    .add_Hm()
                    .format(note.creationTime.toLocal())
                    .toString(),
                textAlign: TextAlign.end,
              ),
            );
          },
        );
      },
    );
  }
}
