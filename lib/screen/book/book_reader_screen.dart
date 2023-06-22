
import 'package:flutter/material.dart';
import 'package:witchbook/model/book_model.dart';
import 'package:witchbook/model/chaper_model.dart';

final BookModel book = BookModel(
  title: 'Sample Book',
  author: 'John Doe',
  chapters: [
    ChapterModel(
      title: 'Chapter 1',
      content: 'Chapter 1 content goes here.',
    ),
    ChapterModel(
      title: 'Chapter 2',
      content: 'Chapter 2 content goes here.',
    ),
    ChapterModel(
      title: 'Chapter 3',
      content:
      'Chapter 3 content goes here. It can be very long and span across multiple pages. '
          'You can swipe left or right to navigate between pages.',
    ),
  ],
);


class BookReaderScreen extends StatelessWidget {

  BookReaderScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title ?? ""),
      ),
      body: PageView.builder(
        itemCount: book.chapters!.length,
        itemBuilder: (context, index) {
          return ChapterPage(chapter: book.chapters![index]);
        },
      ),
    );
  }
}

class ChapterPage extends StatelessWidget {
  final ChapterModel chapter;

  ChapterPage({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          chapter.content ?? "",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
