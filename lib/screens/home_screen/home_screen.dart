import 'package:flutter/material.dart';
import 'package:my_diary/database/database.dart';
import 'package:my_diary/screens/home_screen/widgets/home_screen_list.dart';

import 'package:my_diary/models/journal.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDate = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título basado no dia atual
        title: Text(
          "${currentDate.day} / ${currentDate.month} / ${currentDate.year}",
          style: TextStyle(
            fontFamily: GoogleFonts.dosis().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.pink,
          ),
        ),
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          currentDate: currentDate,
          database: database,
        ),
      ),
    );
  }

  void refresh() {
    setState(() {
      database = generateRandomDatabase(maxGap: windowPage, amount: 3);
    });
  }
}
