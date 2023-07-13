import 'package:flutter/material.dart';
import 'package:my_diary/helpers/weekday.dart';
import 'package:my_diary/models/journal.dart';
import 'package:google_fonts/google_fonts.dart';

class JournalCard extends StatelessWidget {
  final Journal? journal;
  final DateTime showedDate;
  const JournalCard({Key? key, this.journal, required this.showedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return InkWell(
        onTap: () {},
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: Text(
            "${WeekDay(showedDate.weekday).short.toUpperCase()} - ${showedDate.day}",
            style: TextStyle(
                fontSize: 12,
                fontFamily: GoogleFonts.dosis().fontFamily
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Container(
        height: 115,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.pink,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 115,
              width: 75,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    journal!.createdAt.day.toString(),
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.dosis().fontFamily,
                    ),
                  ),
                  Text(
                      WeekDay(journal!.createdAt.weekday).short,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: GoogleFonts.dosis().fontFamily,
                      ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Text(
                  journal!.content,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.dosis().fontFamily,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
