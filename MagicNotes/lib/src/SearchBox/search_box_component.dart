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
  directives: [NgFor, NgIf, routerDirectives, formDirectives],
  // providers: [ClassProvider(SearchService)],
)
class SearchComponent {
  /* binded using the form directive? */

  /// Search value is the string entered into the search box by the user.
  String search_value;

  // final SearchService _searchService;

  final Router _router;

  // SearchComponent(this._searchService, this._router);
  SearchComponent(this._router);

  /// Method to save note through the service
  void save() {}

  void goBack() {
    // When the user clicks the X button to go back to the "all-notes" view
    // _router.navigate(Route_paths.all_notes);
  }
}