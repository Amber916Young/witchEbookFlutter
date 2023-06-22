import 'package:witchbook/model/chaper_model.dart';

class BookModel {
  int? id;
  String? title;
  String? author;
  String? summary;
  List<ChapterModel>? chapters;

  BookModel({ this.id, this.summary, this.title,  this.author,  this.chapters});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    summary = json['summary'];
    if (json['chapters'] != null) {
      chapters = <ChapterModel>[];
      json['companyUsers'].forEach((v) {
        chapters!.add(new ChapterModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['summary'] = this.summary;
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
