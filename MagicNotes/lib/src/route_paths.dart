/*  @Doc
    This module contains all the paths to the different views all in the
    RoutePaths class, which will then be used in the "routes.dart" module
*/

import 'package:angular_router/angular_router.dart';

class RoutePaths {
  // Below are all the param Strings. They are all postfixed with "Param"
  static final idParam = 'id';
  
  static final notes = RoutePath(path: 'notes');
  static final login = RoutePath(path: 'login');
  static final logout = RoutePath(path: 'logout');
  static final settings = RoutePath(path: 'settings');
  // static final dashboard = RoutePath(path: 'dashboard');

  /// The path is made by extending the [notes] path with a [note.id]
  static final note = RoutePath(path: '${notes.path}/:$idParam');
}
