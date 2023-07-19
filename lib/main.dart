import 'package:flutter/material.dart';
import 'package:my_diary/models/journal.dart';
import 'package:my_diary/screens/add_journal_screen/add_journal_screen.dart';
import 'package:my_diary/screens/home_screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  Journal exampleJournal = Journal(id: 'id', content: 'Something', createdAt: DateTime.now(), updatedAt: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.dosis().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          actionsIconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/add-journal') {
          final journal = settings.arguments as Journal;
          return MaterialPageRoute(
            builder: (context) => AddJournalScreen(journal: journal),
          );
        }
      }
    );
  }
}
