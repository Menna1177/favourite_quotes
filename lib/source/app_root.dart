import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../blocks/fav_quotes_cubit.dart';
import '../models/quote.dart';
import '../screens/favourite_quotes_screen.dart';

class AppRoot extends StatelessWidget {
  final Box<Quote> quoteBox;

  const AppRoot({required this.quoteBox, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavQuotesCubit(quoteBox),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: favQuotesScreen(),
      ),
    );
  }
}
