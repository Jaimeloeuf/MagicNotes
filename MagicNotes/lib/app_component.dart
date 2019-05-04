import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:MagicNotes/src/routes.dart';

// Import the components needed
import 'package:MagicNotes/src/Header/header_component.dart';

@Component(
    selector: 'MagicNote',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [routerDirectives, HeaderComponent],
    exports: [RoutePaths, Routes])
class AppComponent {}
