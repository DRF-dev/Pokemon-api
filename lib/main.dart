// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/blocs/http/http.bloc.dart';
import 'package:pokemon/views/accueil/accueil.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HttpBloc(),
      child: MaterialApp(
        title: 'Pokemon API',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(23, 27, 32, 1),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
          primarySwatch: PrimarySwatch.customYellow,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AccueilView.route: (context) => AccueilView(),
          '/s': (context) => Text(""),
        },
      ),
    );
  }
}

class PrimarySwatch {
  static const int _customYellow = 0xFFEEC43A;

  static const MaterialColor customYellow = MaterialColor(
    _customYellow,
    const <int, Color>{
      50: const Color(0xFFe0e0e0),
      100: const Color(0xFFb3b3b3),
      200: const Color(0xFF808080),
      300: const Color(0xFF4d4d4d),
      400: const Color(0xFF262626),
      500: const Color(_customYellow),
      600: const Color(0xFF000000),
      700: const Color(0xFF000000),
      800: const Color(0xFF000000),
      900: const Color(0xFF000000),
    },
  );
}
