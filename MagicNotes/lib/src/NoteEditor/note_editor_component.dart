import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/src/notes_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

/*
  @Doc
  This module contains the note editor.

  @Todo
  - Move the dependency injection of the NotesService out of the @Component annotation
    and into the main dependency injector creator and injection point in main.dart
*/

@Component(
    selector: 'note-editor',
    templateUrl: "note_editor_component.html",
    styleUrls: ['note_editor_component.css'],
    directives: [coreDirectives, formDirectives],
    providers: [ClassProvider(NotesService)])
class NoteEditorComponent implements OnActivate {
  Note note;
  final NotesService _notesService;
  final Location _location;

  NoteEditorComponent(this._notesService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    /*  onActivate hook is called, when the component is called through a route
        The first positional arguement is not used, thus it is "thrown away" with the dash */

    // Create the final id with the self-invoking function
    final id = ((params) {
      final id = params['id'];
      // Parse first as Route parameters are always strings
      return id == null ? null : int.tryParse(id);
    })(current.parameters); // Pass the Route parameters in

    // Get note from the notes_service and set the [note] property
    if (id != null) note = await (_notesService.get(id));
  }
  // void ngOnActivate() {}

  // Save note action is implemented by the note service
  void saveNote() => _notesService.save(note);

  // Instead of going back 1 browser session, which may cause user to leave the app, use the router to route user to all notes view instead.
  void goBack() => _location.back();

  // Use the ngOnDestroy hook method to close the data stream
}
