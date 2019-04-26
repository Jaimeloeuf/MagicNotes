import 'package:angular/angular.dart';

import 'package:MagicNotes/src/todo_list/todo_list_component.dart';
import 'package:MagicNotes/src/Header/header_component.dart';
import 'package:MagicNotes/src/routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: 'MagicNote',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [routerDirectives, TodoListComponent, HeaderComponent],
    exports: [RoutePaths, Routes])
class AppComponent {}
