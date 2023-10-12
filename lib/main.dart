import 'package:bmi/features/bmi/presentation/pages/home/home_page.dart';
import 'package:bmi/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/routes/routes.dart';
import 'config/theme/app_themes.dart';
import 'features/bmi/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'features/bmi/presentation/bloc/article/remote/remote_article_event.dart';
import 'injection_container.dart';
// #docregion AppLocalizationsImport
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// #enddocregion AppLocalizationsImport

// #docregion LocalizationDelegatesImport
import 'package:flutter_localizations/flutter_localizations.dart';
// #enddocregion LocalizationDelegatesImport

Future<void> main() async {

  await initializeDependencies();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme().copyWith(
          searchBarTheme: searchBarTheme()
        ),
        darkTheme: darkTheme(),
        home: const HomePage(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('it'), // Italian
        ],
      ),
    );
  }
}