import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'constraints.dart';
import 'localization/app_localization.dart';

import 'providers/auth.dart';
import 'providers/user_profile.dart';
import 'providers/public_operators.dart';

import 'screens/splashscreen.dart';
import 'screens/tariffs/tariffs_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/signup/signup_screen.dart';
import 'screens/main_page/main_page.dart';
import 'screens/account/account_screen.dart';
import 'screens/account/bike_rents_screen.dart';
import 'screens/account/change_password_screen.dart';
import 'screens/account/personal_data_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PublicOperators(),
        ),
        ChangeNotifierProxyProvider<Auth, UserProfile>(
          create: (ctx) => UserProfile(null, null, null),
          update: (ctx, auth, previusUser) => UserProfile(auth.username,
              auth.token, previusUser == null ? null : previusUser.user),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Go2Bike',
            theme: ThemeData(
              scaffoldBackgroundColor: kPrimaryLightColor,
              fontFamily: 'JosefinSans',
              textTheme: TextTheme(
                bodyText2: TextStyle(
                  color: kPrimaryDarkColor,
                ),
              ),
            ),
            locale: _locale,
            supportedLocales: [
              Locale('en', 'UK'),
              Locale('hr', 'HR'),
            ],
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            home: auth.isAuth
                ? MainPage()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : WelcomeScreen(),
                  ),
            routes: {
              LoginScreen.routeName: (ctx) => LoginScreen(),
              SignUpScreen.routeName: (ctx) => SignUpScreen(),
              Account.routeName: (ctx) => Account(),
              BikeRents.routeName: (ctx) => BikeRents(),
              ChangePassword.routeName: (ctx) => ChangePassword(),
              PersonalData.routeName: (ctx) => PersonalData(),
              Tariffs.routeName: (ctx) => Tariffs(),
            },
          );
        },
      ),
    );
  }
}
