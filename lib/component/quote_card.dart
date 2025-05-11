import 'package:favourite_quotes/screens/favourite_quotes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/fav_quotes_cubit.dart';
import '../models/quote.dart';
class QuoteCard extends StatelessWidget {
  final Quote quote;

  const QuoteCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text('"${quote.content}"'),
        subtitle: Text(quote.author,
            style: TextStyle(color: Colors.grey)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            context.read<FavQuotesCubit>().deleteQuote(quote.id);
          },
        ),
      ),
    );
  }
}
