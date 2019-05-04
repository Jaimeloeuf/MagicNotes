import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

// Import the sub components used in this page.
import 'package:MagicNotes/src/Notes/notes_component.dart';
import 'package:MagicNotes/src/SearchBox/search_box_component.dart';
import 'package:MagicNotes/src/NoteEditor/note_editor_component.dart';

/*
  @Doc
  View description.md for more details

  @Todo
*/

@Component(
  selector: 'notes-view',
  templateUrl: 'notes_view_component.html',
  styleUrls: ['notes_view_component.css'],
  directives: [
    NgFor,
    NgIf,
    SearchComponent,
    AllNotesComponent,
    NoteEditorComponent
  ],
)
class NotesView implements OnInit /* OnActivate  */ {
  final Router _router;

  // AppComponent Contructor takes in Notes Bloc and router dependency via injection.
  NotesView(this._router);

  // Implementation of the Component Init lifecycle hook
  @override
  void ngOnInit() {}

  // Might remove the ngOnInit hook, as the component should not be destroyed and recreated, but rather when navigated too and shown. Thus more of display and hide
  // And it should not be updating the whole thing, it should only check if there is anything changed, else do nothing.
  // See how to make the _notes be available from a stream instead, thus it can always stream data to and from the BLoC object
  // and the notesComponent no longer needs to maintain a copy of the _notes in memory!
  /*  @override
  void onActivate(_, RouterState current) {
    print('Notes route activated');
    _getNotes();
  } */
}
