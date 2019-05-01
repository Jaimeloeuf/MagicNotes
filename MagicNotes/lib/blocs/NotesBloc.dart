import 'package:MagicNotes/src/Note.dart';

class NotesService {
  List<Note> notes = [
    Note.full_basic(1, "title1", "Hello world"),
    Note.full_basic(2, "t", "Hello1 world"),
    Note.full_basic(3, "i", "Hellodsf world"),
    Note.full_basic(4, "wow this is cool", "rld"),
    Note.full_basic(5, "sfgfg", "Bye"),
  ];

  /* See how to check dart sdk version and see if I need to update it because
  of the export of the stupid Future thing where the Future thing not exported from core until 2.1  */ 

  Future<List<Note>> getAll() async => notes;

  // Future<Note> get(int id) async =>
  //     (await getAll()).firstWhere((note) => note.id == id);
  Note get(int id) => notes.firstWhere((note) => note.id == id);
  Note selected;
}
