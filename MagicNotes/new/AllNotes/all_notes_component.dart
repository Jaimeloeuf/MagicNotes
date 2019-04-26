import 'dart:async';
import 'package:MagicNotes/src/Note.dart';
import 'package:MagicNotes/src/NotesService.dart';
import 'package:MagicNotes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

// import the notes service


@Component(
  selector: 'all-notes',
  templateUrl: 'all_notes_component.html',
  styleUrls: ['all_notes_component.css'],
  directives: [NgFor, NgIf])
class AllNotesComponent implements OnInit {
  Note selected_note;
  List<Note> _notes;

  get notes => _notes;

  // Define hero service property for this component
  final NotesService _notesService;
  final Router _router;

  // AppComponent Contructor that takes in a HeroService instance, by dependency injection.
  // Inject the router too
  AllNotesComponent(this._notesService, this._router);

  // On click handler, that takes in the selected hero
  void onSelect(Note hero) => selected_note = hero;

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
