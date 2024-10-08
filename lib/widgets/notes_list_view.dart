import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

final GlobalKey<AnimatedListState>animatedController = GlobalKey();
final ScrollController scrollController = ScrollController();

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>notes = BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Expanded(
          child: AnimatedList(
            controller: scrollController,
            key: animatedController,
            initialItemCount: notes.length,
            itemBuilder: (context, index,animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: CustomNoteItem(note: notes[index],),
                ),
              );
            },
          ),
        );
      },
    );
  }
}


