// this will generate different routes for each screen.
import 'package:google_fonts/google_fonts.dart';
import 'package:task_and_go_app/User_Authentication_Pages/authModel.dart';
import 'package:task_and_go_app/User_Authentication_Pages/registration.dart';
import 'package:task_and_go_app/screens/UserInterfaceScreens/MainScreens/DashScreen.dart';
import 'package:task_and_go_app/screens/UserInterfaceScreens/MainScreens/SearchScreen.dart';
import 'package:task_and_go_app/screens/UserInterfaceScreens/ProfileScreens/AddressScreens/DeliveryScreen.dart';
import 'package:task_and_go_app/screens/screens.dart';

import '../User_Authentication_Pages/authentication_check.dart';
class AppRouter {
  // This function will generate different routes for each screen.
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var routes = <String, Route<dynamic> Function()>{
      'splash-screen': SplashScreen.route,
      'home_screen': HomeScreen.route,
      'dashboard-screen': DashBoard.route,
      'search_home-screen': SearchHomeScreen.route,
      'profile-screen': ProfilePage.route,
      'booking-screen': Booking.route,
      'search-page': SearchScreen.route,
      'login-screen': Login_Page.route,
      'Registration_Page': Registration_Page.route,
      'Authentication': Authentication.route,
      'landing-page': on_Landing_Page.route,
      'chat-screen': chatScreen.route,
      'dash-screen': DashPage.route,
      'appointment-screen': Appointments.route,
      'fav-screen': Favourites.route,
      'tasks-screen': Tasks.route,
      'user-settings-screen': User_Settings.route,
      'forgot-password': ForgotPasswordPage.route,
      'address-screen': AddressScreen.route,
      'delivery-screen': AddDelivery.route,
      'change-password': ChangePassword.route,
    };
    if (routes.containsKey(settings.name)) {
      return routes[settings.name]!();
    } else {
      return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('🙊Oops! Something went wrong!🙈',
            style: TextStyle(
              fontSize: 30,
              fontFamily: GoogleFonts.rajdhani().fontFamily,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    });
  }
}
