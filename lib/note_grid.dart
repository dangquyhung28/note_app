import 'package:flutter/material.dart';
import 'package:note_app/note_card.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, int index) {
          return NoteCard(
            isInGrid: true,
          );
        });
  }
}
