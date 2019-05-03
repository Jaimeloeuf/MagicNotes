import 'package:angular/angular.dart';
import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/blocs/notes_bloc.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

/*
  @Doc
  This module contains the note editor.
  Upon navigating to this component via a route, take the note id for the URL and get the note to display for user to edit the note

  @Todo
  - Move the dependency injection of the NotesService out of the @Component annotation
    and into the main dependency injector creator and injection point in main.dart
*/

@Component(
    selector: 'note-editor',
    templateUrl: "note_editor_component.html",
    styleUrls: ['note_editor_component.css'],
    directives: [coreDirectives, formDirectives])
class NoteEditorComponent implements OnActivate, OnInit {
  Note note;

  final NotesBloc _notesBloc;
  final Location _location;

  NoteEditorComponent(this._notesBloc, this._location);

  @override
  void ngOnInit() {
    print('editor componentd created');
    note = _notesBloc.selected;
  }

  @override
  void onActivate(_, RouterState current) async {
    print('editor called');
    note = _notesBloc.selected;
    /*  onActivate hook is called, when the component is called through a route
        The first positional arguement is not used, thus it is "thrown away" with the dash */

    // Create the final id with the self-invoking function
    final id = ((params) {
      final id = params['id'];
      // Parse first as Route parameters are always strings
      return id == null ? null : int.tryParse(id);
    })(current.parameters); // Pass the Route parameters in

    // Get note from the notes_service and set the [note] property
    if (id != null) note = await (_notesBloc.get(id));
  }

  // Save note action is implemented by the note service
  // void saveNote() => _notesService.save(note);

  // Instead of going back 1 browser session, which may cause user to leave the app, use the router to route user to all notes view instead.
  void goBack() => _location.back();

  // Use the ngOnDestroy hook method to close the data stream
}
