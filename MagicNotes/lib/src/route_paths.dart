/*  @Doc
    This module contains all the paths to the different views all in the
    RoutePaths class, which will then be used in the "routes.dart" module
*/

import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final notes = RoutePath(path: 'notes');
  static final login = RoutePath(path: 'login');
  static final logout = RoutePath(path: 'logout');
  static final settings = RoutePath(path: 'settings');
  // static final dashboard = RoutePath(path: 'dashboard');

  static final id = 'id';

  /// The path is made by extending the [notes] path with a [note.id]
  static final note = RoutePath(path: '${notes.path}/:$id');
}
