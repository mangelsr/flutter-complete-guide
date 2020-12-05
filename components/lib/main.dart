import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';

// import 'package:components/src/pages/home_temp.dart';
// import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('es'),
        ],
        title: 'Components App',
        // home: HomePage(),
        initialRoute: '/',
        routes: getAppRoutes(),
        // onGenerateRoute: (RouteSettings settings) {
        //   print('${settings.name}');
        //   return MaterialPageRoute(
        //     builder: (BuildContext context) => AlertPage(),
        //   );
        // },
      );
}
