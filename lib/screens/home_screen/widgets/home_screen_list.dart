import 'package:my_diary/models/journal.dart';
import 'journal_card.dart';

List<JournalCard> generateListJournalCards(
    {required int windowPage,
    required DateTime currentDate,
    required Map<String, Journal> database}) {
  // Cria uma lista de Cards vazios
  List<JournalCard> list = List.generate(
    windowPage + 1,
    (index) => JournalCard(
      showedDate: currentDate.subtract(Duration(days: (windowPage) - index)),
    ),
  );

  //Preenche os espaços que possuem entradas no banco
  database.forEach((key, value) {
    if (value.createdAt.isAfter(currentDate.subtract(Duration(days: windowPage))) ||
        value.createdAt.isAtSameMomentAs(currentDate.subtract(Duration(days: windowPage)))) {
          int difference = value.createdAt
            .difference(currentDate.subtract(Duration(days: windowPage)))
            .inDays
            .abs();

      list[difference] = JournalCard(
        showedDate: list[difference].showedDate,
        journal: value,
      );
    }
  });
  return list.reversed.toList();
}
