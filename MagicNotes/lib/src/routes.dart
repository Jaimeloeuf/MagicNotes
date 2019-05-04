/*  @Doc
    This module contains all the route definitions for the different route
    paths defined in the "route_paths.dart" module.
*/

import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

/// Name the imports, to avoid analyzer error. These are all for the component factories
// The below imports are currently example imports from another project, will be changed
import './NotesView/notes_view_component.template.dart' as notes_view_template;
import './NoteEditor/note_editor_component.template.dart' as note_editor_template;
import './Login/login_component.template.dart' as login_template;
import './Settings/settings_component.template.dart' as settings_template;

export 'route_paths.dart';

// These RouteDefinitions are static, as we are not using this class to make objects
class Routes {
  static final notes = RouteDefinition(
      // The router matches this path against the URL
      routePath: RoutePaths.notes,
      // The (factory of the) component that activates when this route is entered
      component: notes_view_template.NotesViewNgFactory);

  static final note = RouteDefinition(
      routePath: RoutePaths.note,
      component: note_editor_template.NoteEditorComponentNgFactory);

  static final login = RouteDefinition(
      routePath: RoutePaths.login,
      component: login_template.LoginComponentNgFactory);

  // To Change the logout code
  static final logout = RouteDefinition(
      routePath: RoutePaths.logout,
      component: login_template.LoginComponentNgFactory);

  
  // To Change the settings code
  static final settings = RouteDefinition(
      routePath: RoutePaths.settings,
      component: settings_template.SettingsComponentNgFactory);

  // The Routes.all field is a list of route definitions.
  static final all = <RouteDefinition>[
    notes,
    note,

    login,
    logout,
    settings,

    // Below redirect is to set the "/" path to be redirected to show all notes on startup
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.notes.toUrl(),
    )
  ];
}
