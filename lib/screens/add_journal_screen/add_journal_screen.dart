import 'package:flutter/material.dart';
import 'package:my_diary/helpers/weekday.dart';
import 'package:my_diary/models/journal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diary/services/journal_service.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;

  AddJournalScreen({required this.journal, key});

  final TextEditingController contentController = TextEditingController();
  registerJournal(BuildContext context) async {
    String content = contentController.text;

    journal.content = content;

    JournalService journalService = JournalService();
    bool result = await journalService.register(journal);

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text('${WeekDay(journal.createdAt.weekday).long}, ${journal.createdAt.day} de ${journal.createdAt.month} de ${journal.createdAt.year}'),
        actions: [
          IconButton(onPressed: registerJournal(context), icon: Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: contentController,
          maxLines: null,
          minLines: null,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 16,  fontFamily: GoogleFonts.dosis().fontFamily),
          expands: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Escreva aqui...',
            hintStyle: TextStyle(fontSize: 16, fontFamily: GoogleFonts.dosis().fontFamily),
          ),
        ),
      ),
    );
  }

}
