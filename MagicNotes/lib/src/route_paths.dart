import 'package:angular_router/angular_router.dart';

class RoutePaths {
  static final notes = RoutePath(path: 'notes');
  // static final dashboard = RoutePath(path: 'dashboard');

  static final id = 'id';
  /// The path is made by extending the [notes] path with a [note.id]
  static final note = RoutePath(path: '${notes.path}/:$id');
}