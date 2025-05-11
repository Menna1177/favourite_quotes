import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../blocks/fav_quotes_cubit.dart';
import '../models/quote.dart';

class AddQuoteDialog extends StatelessWidget {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add New Quote"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: contentController,
              decoration: InputDecoration(labelText: 'Quote')),
          TextField(controller: authorController,
              decoration: InputDecoration(labelText: 'Author')),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel',
        style: TextStyle(color: Color(0xF7650778)),)),

        ElevatedButton(
          onPressed: () {
            var uuid = Uuid();
            String uniqueId = uuid.v4();
            Quote newQuote = Quote(
              id: uniqueId,
              content: contentController.text,
              author: authorController.text,
            );
            context.read<FavQuotesCubit>().addQuote(newQuote);
            Navigator.pop(context);
          },
          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xF7650778))),
          child: Text("Save", style: TextStyle(color: Colors.white)),
        )



      ],
    );
  }
}
