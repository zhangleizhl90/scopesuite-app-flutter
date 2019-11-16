import 'package:app/pages/card_list.dart';
import 'package:app/pages/index.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textSelectionColor: Colors.black87,
      ),
      routes: _buildRoutes(),
      home: CardListPage(),
    );
  }

   Map<String, WidgetBuilder> _buildRoutes() {
    return <String, WidgetBuilder>{
      '/Home': (BuildContext _) => HomePage(),
      '/SelectRegionPage': (BuildContext _) => SelectRegionPage(),
      '/Login': (BuildContext _) => LoginPage(),
      '/ForgotPassword': (BuildContext _) => ForgotPasswordPage(),
      '/ChangePassword': (BuildContext _) => ChangePasswordPage(),
      '/ClaimAccount': (BuildContext _) => ClaimAccount(),
      '/Privacy': (BuildContext _) => PrivacyPolicyPage(),

      '/Settings': (BuildContext _) => SettingsPage(),
      '/Profile': (BuildContext _) => ProfilePage(),
      '/Dashboard': (BuildContext _) => DashboardPage(),
      '/Competency': (BuildContext _) => CompetencyPage(),
      '/Notifications': (BuildContext _) => NotificationsPage(),
      '/Resources': (BuildContext _) => ResourcesPage(),

      '/CardList': (BuildContext _) => CardListPage(),
    };
  }
}