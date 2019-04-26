import 'package:angular/angular.dart';

import 'package:MagicNotes/src/Login/login_component.dart';
import 'package:MagicNotes/src/todo_list/todo_list_component.dart';
import 'package:MagicNotes/src/Header/header_component.dart';

@Component(
  selector: 'MagicNote',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent, HeaderComponent, LoginComponent],
)
class AppComponent {
}
