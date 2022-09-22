import 'package:chat_sap/screens/messages/home_page.dart';
import 'package:chat_sap/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';

import 'screens/chats/profile/profile_screen.dart';
import 'screens/welcome/welcome_screen.dart';

// const kLoginRoute = '/login';
const kMainRoute = '/';
const kHomeRoute = '/home';
const kProfileRoute = '/profile';
const kSignInSignUpRoute = '/signInSignUp';
// const kSearchRoute = '/search';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => SplashPage(),
  kHomeRoute: (_) => HomePage(),
  kProfileRoute: (_) => ProfileScreen(),
  kSignInSignUpRoute: (_) => LoginPage(),
  // kLoginRoute: (_) => LoginScreen(),
  // kSearchRoute: (_) => SearchScreen(),
};
