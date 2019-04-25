/*  @Doc
    This module contains all the route definitions for the different route
    paths defined in the "route_paths.dart" module.
*/

import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

/// Name the imports, to avoid analyzer error. These are all for the component factories
// The below imports are currently example imports from another project, will be changed
// import './HeroListComponent/hero_list_component.template.dart'
//     as hero_list_template;
// import './DashboardComponent/dashboard_component.template.dart'
//     as dashboard_template;
// import './HeroComponent/hero_component.template.dart' as hero_template;

export 'route_paths.dart';

// These RouteDefinitions are static, as we are not using this class to make objects
class Routes {
  static final notes = RouteDefinition(
      // The router matches this path against the URL
      routePath: RoutePaths.notes,
      // The (factory of the) component that activates when this route is entered
      component: hero_list_template.HeroListComponentNgFactory);

  static final note = RouteDefinition(
      routePath: RoutePaths.note,
      component: dashboard_template.DashboardComponentNgFactory);

  // The Routes.all field is a list of route definitions.
  static final all = <RouteDefinition>[
    notes,
    note,

    // Below redirect is to set the "/" path to be redirected to show all notes on startup
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.notes.toUrl(),
    )
  ];
}
