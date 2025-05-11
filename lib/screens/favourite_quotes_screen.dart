import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/fav_quotes_cubit.dart';
import '../component/add_quote_dialog.dart';
import '../component/quote_card.dart';
import '../models/quote.dart';

class favQuotesScreen extends StatefulWidget {

  const favQuotesScreen({super.key});

  @override
  State<favQuotesScreen> createState() => _favQuotesScreenState();
}

class _favQuotesScreenState extends State<favQuotesScreen> {
  final List<String> quotes = [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xF7650778),
        title: Center(
          child: Text("Fav Quotse", style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFDBAAE6),
    body: BlocBuilder<FavQuotesCubit, List<Quote>>(
    builder: (context, quotes) {
      return ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return QuoteCard(quote: quotes[index]);
        },
      );
    },
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context, builder: (context) => AddQuoteDialog()),
        child: Icon(Icons.add),
      ),
    );
  }
}
