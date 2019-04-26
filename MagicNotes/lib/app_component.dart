import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:MagicNotes/src/routes.dart';

// Import the components needed
import 'package:MagicNotes/src/Header/header_component.dart';
import 'package:MagicNotes/src/SearchBox/search_box_component.dart';

@Component(
    selector: 'MagicNote',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [routerDirectives, HeaderComponent, SearchComponent],
    exports: [RoutePaths, Routes])
class AppComponent {}
