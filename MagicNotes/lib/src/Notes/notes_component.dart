import 'dart:async';
import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/src/NotesService.dart';
import 'package:MagicNotes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

// import the notes service

@Component(
    selector: 'notes',
    templateUrl: 'notes_component.html',
    styleUrls: ['notes_component.css'],
    directives: [NgFor, NgIf])
class AllNotesComponent implements OnInit {
  Note selected_note;
  List<Note> _notes;

  final NotesService _notesService;
  final Router _router;

  // AppComponent Contructor takes in HeroService and router dependency via injection.
  AllNotesComponent(this._notesService, this._router);

  get notes => _notes;

  // On click handler that takes in the selected note
  void onSelect(Note hero) {
    // Set the note to be the selected_note first
    selected_note = hero;

    // Navigate to the /note/:id route for the user to edit that note directly.
  }

  // Set the list of heroes from the Hero services
  Future<void> _getNotes() async => _notes = await _notesService.getAll();

  // Implementation of the Component Init lifecycle hook
  @override
  void ngOnInit() => _getNotes();

  String noteUrl(int id) =>
      RoutePaths.notes.toUrl(parameters: {RoutePaths.id: '$id'});

  Future<NavigationResult> viewNote() =>
      _router.navigate(noteUrl(selected_note.id));
}
