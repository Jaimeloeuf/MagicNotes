import 'dart:async';
import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/src/NotesService.dart';
import 'package:MagicNotes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

/*
  @Doc
  This module holds the component that displays all the Notes.

  @Todo
  - Move the dependency injection of the NotesService out of the @Component annotation
    and into the main dependency injector creator and injection point in main.dart
*/

@Component(
    selector: 'notes',
    templateUrl: 'notes_component.html',
    styleUrls: ['notes_component.css'],
    directives: [NgFor, NgIf],
    providers: [ClassProvider(NotesService)])
class AllNotesComponent implements OnInit {
  Note selected_note;
  List<Note> _notes;

  final NotesService _notesService;
  final Router _router;

  // AppComponent Contructor takes in _notesService and router dependency via injection.
  AllNotesComponent(this._notesService, this._router);

  get notes => _notes;

  // On click handler that takes in the selected note
  void onSelect(Note note) {
    // Set the note to be the selected_note first
    selected_note = note;

    // Navigate to the /note/:id route for the user to edit that note directly.
    viewNote();
  }

  // Set the list of notes from the _notesService
  Future<void> _getNotes() async => _notes = await _notesService.getAll();

  // Implementation of the Component Init lifecycle hook
  @override
  void ngOnInit() => _getNotes();

  // Given a note id, create a URL for that note and return it.
  String noteUrl(int id) =>
      RoutePaths.note.toUrl(parameters: {RoutePaths.id: '$id'});

  // Navigate to the note editor displaying the selected note
  Future<NavigationResult> viewNote() =>
      _router.navigate(noteUrl(selected_note.id));
}
