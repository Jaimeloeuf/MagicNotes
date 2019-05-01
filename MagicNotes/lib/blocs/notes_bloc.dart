import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/services/notes_service.dart';

class NotesBloc {
  // Need NotesService object to use
  NotesBloc(this._notesService);

  final NotesService _notesService;

  Future<List<Note>> getAll() async => _notesService.getAll();

  Note get(int id) => _notesService.get(id);
  
  Note selected;
}
