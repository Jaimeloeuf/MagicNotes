import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
    selector: "login",
    templateUrl: "login_component.html",
    styleUrls: ["login_component.css"],
    directives: [coreDirectives, routerDirectives])
class LoginComponent {
  String email = "";
  String password = "";

  String btn_value = "Login";

  // final AuthService _authService;

  // UserCred(this._authService, this.email, this.password);

  // Future<bool> authenticate() async {
  //   Response response = await _authService.check(email, password);

  // Set the token

  // if (response.status == 200) return true;
  // }

  @override
  void ngOnInit() {
    // Do stuff when component is created

    // emailLoginBlocStream =
    //     emailLoginBloc.session.isSignedIn.listen((bool isSignedIn) {
    //   if (!isSignedIn) {
    //     emailLoginBloc.emailSink.add('');
    //   } else {
    //     router.navigate('shop');
    //   }
    // });
  }

  @override
  void ngOnDestroy() {
    // Cancel and destroy the email login bloc when component is destroyed
    // if (emailLoginBlocStream != null) emailLoginBlocStream.cancel();
  }

  bool onSubmit() {
    return true;
  }
}

//   BaseBlocComponent
// providers: [
//   ClassProvider(EmailLoginBloc),
//   ExistingProvider(BaseBloc, EmailLoginBloc)
// ]

// class LoginComponent implements OnInit, OnDestroy {
//   LoginComponent(this.baseBloc, this.emailLoginBloc, this.router);

//   StreamSubscription emailLoginBlocStream;
//   BaseBloc baseBloc;
//   EmailLoginBloc emailLoginBloc;
//   Router router;

//   void onEmailTextChanged(String email) {
//     this.email = email.toLowerCase();
//     emailLoginBloc.emailSink.add(email.toLowerCase());
//   }

//   void onPasswordTextChanged(String password) {
//     this.password = password;
//     emailLoginBloc.passwordSink.add(password);
//   }

//   void onSubmit() async {
//     clearErrorMessage();
//     email = await emailLoginBloc.emailStream.first;
//     if (email != null && password != null) {
//       emailLoginBloc.emailLoginSink.add(true);
//       email = null;
//       password = null;
//     } else {
//       baseBloc.error.add('Please fill in the login details.');
//     }
//   }
// }
