part of 'fav_quotes_cubit.dart';

@immutable
sealed class FavQuotesState {}

final class FavQuotesInitial extends FavQuotesState {}
final class loadQuotes extends FavQuotesState {}
final class addQuote extends FavQuotesState {}
final class deleteQuote extends FavQuotesState {}
