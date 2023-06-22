import 'book_model.dart';

class CategoryModel {
  int? id;
  String? name;
  List<BookModel> ? books;

  CategoryModel({this.id, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['books'] != null) {
      books = <BookModel>[];
      json['companyUsers'].forEach((v) {
        books!.add(new BookModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


