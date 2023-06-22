import 'package:witchbook/model/chaper_model.dart';

class BookModel {
  final String title;
  final String author;
  final List<ChapterModel> chapters;

  BookModel({required this.title, required this.author, required this.chapters});
}
