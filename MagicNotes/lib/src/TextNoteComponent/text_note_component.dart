import 'package:angular/angular.dart';
import 'package:MagicNotes/src/TextNoteComponent/text_note_service.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'text-note',
  templateUrl: 'text_note_component.html',
  styleUrls: ['text_note_component.css'],
  directives: [NgFor, NgIf, routerDirectives],
  providers: [ClassProvider(TextNoteService)],
)
class TextNoteComponent implements OnInit {
  /* Perhaps the note can be binded using the form directive? */

  /*To update this to be like the hero thing
    
    This componenent should be the one used for editing the note, not
    the one that list out all of the text notes!.

  */

  final TextNoteService _textNoteService;
  final Router _router;

  List<TextNote> textNotes;
  TextNote currentNote;

  /// Get the textNoteService and the router via dependency injection
  TextNoteComponent(this._textNoteService, this._router);


  @override
  Future<Null> ngOnInit() async {
    textNotes = await _textNoteService.getAll();
  }

  /// Method to save note through the service
  void save() {}

  void goBack() {
    // When the user wants to go back.
    // Save before leaving
    save();


    // When the user clicks the X button to go back to the "all-notes" view
    _router.navigate(Route_paths.all_notes);
  }

  // Pass the delete operation to the textNoteService
  void delete(int id) => _textNoteService.delete(id);
}
