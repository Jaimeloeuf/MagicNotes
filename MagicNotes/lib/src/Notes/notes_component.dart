import 'dart:async';
import 'package:MagicNotes/blocs/notes_bloc.dart';
import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

/*
  @Doc
  This component that displays the notes, that matches the view schema.
  The view schema is provided by either the view by tag service or the view by search service

  @Todo
  - Move the dependency injection of the NotesService out of the @Component annotation and into the main dependency injector creator and injection point in main.dart

  - Perhaps the dependency injected should be changed to notesbloc and injected from the main injection point.

  - Updating so that this component is not destroyed everytime user navigates away and recreated when the user navigates to the route of notes again. Which is problematic due to the need to recreate component redraw and requiring the same resources from the server again and again.
*/

@Component(
    selector: 'notes',
    templateUrl: 'notes_component.html',
    styleUrls: ['notes_component.css'],
    directives: [NgFor, NgIf],
    providers: [/* ClassProvider(NotesService) */])
class AllNotesComponent implements OnInit /* OnActivate  */ {
  List<Note> _notes;

  // final NotesService _notesService;
  final NotesBloc _notesBloc;
  final Router _router;

  // AppComponent Contructor takes in _notesService and router dependency via injection.
  AllNotesComponent(this._notesBloc, this._router);

  // Getter for the template to access the private _notes field
  // To change this to attach the List of notes from a stream from the NotesService
  get notes => _notes;

  // Set the list of notes from the _notesService
  // Update this, to make the notes component stream data from the service, and only get data when data is changed.
  Future<void> _getNotes() async => _notes = await _notesBloc.getAll();

  // Implementation of the Component Init lifecycle hook
  @override
  void ngOnInit() => _getNotes();

  // Might remove the ngOnInit hook, as the component should not be destroyed and recreated, but rather when navigated too
  // And it should not be updating the whole thing, it should only check if there is anything changed, else do nothing.
  // See how to make the _notes be available from a stream instead, thus it can always stream data to and from the notesService
  // and the notesComponent no longer needs to maintain a copy of the _notes in memory!
  /*  @override
  void onActivate(_, RouterState current) {
    print('Notes route activated');
    _getNotes();
  } */

  // Given a note id, create a URL for that note and return it.
  String noteUrl(int id) =>
      RoutePaths.note.toUrl(parameters: {RoutePaths.idParam: '$id'});

  // onClick handler that navigates to selected note's "/note/:id" route for user to edit the note
  Future<NavigationResult> viewNote(Note selected_note) =>
      _router.navigate(noteUrl(selected_note.id));
}
