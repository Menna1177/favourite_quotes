import 'package:hive/hive.dart';

part 'quote.g.dart';

@HiveType(typeId: 0)
class Quote extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String content;
  @HiveField(2)
  String author;

  Quote({required this.id, required this.content, required this.author});
}
