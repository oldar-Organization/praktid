import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ar']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        title: 'PrakTİD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
            splash: Icons.home,
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blue,
            nextScreen: Page1()),
/*      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(height: 100,width: 100, color:Colors.blue,);
          Container(
          child: Text(
          'Splash Screen', style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold),
          ),
          ),
          ],),
          ),    */
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localization'),
      ),
      body: Container(
        child: Center(
          child: LocaleText(
            'welcome',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.language_outlined),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LanguagePage()),
        ),
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText('Language'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('English'),
            onTap: LocaleNotifier.of(context).change('en'),
          ),
          ListTile(
            title: Text('العربية'),
            onTap: LocaleNotifier.of(context).change('ar'),
          ),
        ],
      ),
    );
  }
}
