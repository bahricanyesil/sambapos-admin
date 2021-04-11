import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/constants/navigation.dart';
import 'core/init/screen/screen_config.dart';
import 'core/localization/localization_delegate.dart';
import 'core/provider/language_provider.dart';
import 'core/theme/light_theme.dart';
import 'views/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appLanguage = AppLanguage();
  appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  const MyApp({required this.appLanguage});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            OrientationBuilder(builder: (context, orientation) {
              Sc().init(constraints, orientation);
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_) => widget.appLanguage,
                  ),
                ],
                child: App(),
              );
            }));
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(builder: (context, model, child) {
      return MaterialApp(
        title: 'SambaPOS Admin Panel',
        debugShowCheckedModeBanner: false,
        theme: getLightTheme(),
        onGenerateRoute: Routers.generateRoute,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          MyLocalizationsDelegates.delegate,
        ],
        locale: model.appLocale,
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('tr', 'TR'),
        ],
        initialRoute: loginRoute,
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        },
      );
    });
  }
}
