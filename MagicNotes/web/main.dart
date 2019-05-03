import 'package:MagicNotes/services/notes_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:MagicNotes/app_component.template.dart' as ng;

/* !!!IMP  The below package is needed even if the compilation does not specify it.
  Without the package, the dependency injection for the HeroService will not work
  when switching over from InMemory data to InMemory HTTP server!!!
  Most likely its because without this, the InMemoryDataService will fail
  silently which cause it to be unusable and not injectable to the other components. */
import 'package:http/http.dart';

import 'package:MagicNotes/blocs/notes_bloc.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  routerProvidersHash,

  ClassProvider(NotesBloc),
  ClassProvider(NotesService),
  // Using a real back end?
  // Import 'package:http/browser_client.dart' and change the above to:
  // ClassProvider(Client, useClass: BrowserClient),
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
