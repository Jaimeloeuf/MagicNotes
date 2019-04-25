import 'package:angular/angular.dart';

import 'src/todo_list/todo_list_component.dart';
import 'package:MagicNotes/src/HeaderComponent/header_component.dart';

@Component(
  selector: 'MagicNote',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent, HeaderComponent],
)
class AppComponent {
}
