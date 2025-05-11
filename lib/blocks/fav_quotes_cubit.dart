import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../models/quote.dart';

part 'fav_quotes_state.dart';

class FavQuotesCubit extends Cubit<List<Quote>> {
  final Box<Quote> quoteBox;

  FavQuotesCubit(this.quoteBox) : super([]) {
    loadQuotes();
  }

  void loadQuotes() {
    emit(quoteBox.values.toList());
  }

  void addQuote(Quote quote) {
    quoteBox.add(quote);
    loadQuotes();
  }

  void deleteQuote(String id) {
    final quoteToDelete = quoteBox.values.firstWhere((quote) => quote.id == id);
    quoteToDelete.delete();
    loadQuotes();
  }
}
