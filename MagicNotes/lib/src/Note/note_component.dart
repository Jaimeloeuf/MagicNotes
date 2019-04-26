import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/src/NotesService.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'note',
    templateUrl: "note_component.html",
    styleUrls: ['note_component.css'],
    directives: [coreDirectives, formDirectives])
class NoteComponent implements OnActivate {
  Note note;
  final NotesService _notesService;
  final Location _location;

  NoteComponent(this._notesService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    // onActivate hook is called, when the component is called through a route
    // The first positional arguement is not used, thus it is "thrown away" with the dash
    final id = getId(current.parameters);

    if (id != null) note = await (_notesService.get(id));
  }

  int getId(Map<String, String> parameters) {
    final id = parameters['id'];

    // Route parameters are always strings, thus need to parse first
    return id == null ? null : int.tryParse(id);
  }

  // void saveNote() => _notesService.save(note);
  // Below is dummy function to prevent compilation from breaking
  void saveNote() => _notesService;

  // Instead of going back 1 browser session, which may cause user to leave the app, use the router to route user to all notes view instead.
  void goBack() => _location.back();
}
