import 'package:chat_sap/screens/signinOrSignUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';

import 'screens/chats/chats_screen.dart';
import 'screens/chats/profile/profile_screen.dart';
import 'screens/welcome/welcome_screen.dart';

// const kLoginRoute = '/login';
const kMainRoute = '/';
const kChatsRoute = '/chats';
const kProfileRoute = '/profile';
const kSignInSignUpRoute = '/signInSignUp';
// const kSearchRoute = '/search';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => WelcomeScreen(),
  kChatsRoute: (_) => ChatsScreen(),
  kProfileRoute: (_) => ProfileScreen(),
  kSignInSignUpRoute: (_) => SigninOrSignupScreen(),
  // kLoginRoute: (_) => LoginScreen(),
  // kSearchRoute: (_) => SearchScreen(),
};
