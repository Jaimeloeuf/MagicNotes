import 'package:angular_router/angular_router.dart';

class Route_path {
  static final all_notes = RoutePath(path: 'notes');
  // static final dashboard = RoutePath(path: 'dashboard');

  static final id = 'id';
  /// The path is made by extending the [notes] path with a [note.id]
  static final hero = RoutePath(path: '${all_notes.path}/:$id');
}