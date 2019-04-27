import 'package:MagicNotes/src/route_paths.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:MagicNotes/src/SearchBox/search_service.dart';

/* 

  Search component is the search box without the search results view

  The search results component will be another one that will only be displayed
  through router-outlet to the main display section

  Should the above 2 component be combined? Or better to have them seperately?
 */

@Component(
  selector: 'search-box',
  templateUrl: 'search_box_component.html',
  styleUrls: ['search_box_component.css'],
  directives: [NgIf, routerDirectives, formDirectives],
  // providers: [ClassProvider(SearchService)],
)
class SearchComponent {
  /* binded using the form directive? */

  /// Search value is the string entered into the search box by the user.
  /// The inital value is an empty string. Needed for the check in the template
  String search_value = "";

  // final SearchService _searchService;
  final Router _router;

  // SearchComponent(this._searchService, this._router);
  SearchComponent(this._router);

  /*  Implement a lifecycle hook to close display the search result when search value changes
      Also remove the note editor or the notes list if displaying the search result */

  void goBack() {
    // Clear the search_value when the user navigates back
    search_value = "";

    // When the user clicks the X button to go back to the "all-notes" view
    _router.navigate(RoutePaths.notes.toUrl());

    // Or just navigate back 1 page
    // _location.back();
  }
}
