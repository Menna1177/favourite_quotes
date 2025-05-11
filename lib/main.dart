import 'package:favourite_quotes/source/app_root.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/quote.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuoteAdapter());
  var quoteBox = await Hive.openBox<Quote>('quotes');
  runApp(AppRoot(quoteBox: quoteBox));
}
