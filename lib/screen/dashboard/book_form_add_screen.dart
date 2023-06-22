import 'package:flutter/material.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';
import '../../widgets/header/gradient_appBar.dart';



class Book {
  final String author;
  final String category;
  final List<String> tags;
  final String description;
  final String status;

  Book({
    required this.author,
    required this.category,
    required this.tags,
    required this.description,
    required this.status,
  });
}



class AddBookFormScreen extends StatefulWidget {
  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<String> categories = ['Fiction', 'Non-fiction', 'Sci-Fi', 'Mystery', 'Thriller', 'Biography'];
  final List<String> tags = ['Adventure', 'Romance', 'Sci-Fi', 'Mystery', 'Thriller', 'Biography'];

  String author = '';
  String category = 'Fiction';
  List<String> selectedTags = [];
  String description = '';
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrandientAppBar(
          showAvatar: false,
          onNavigate: () {},
          title: Styles.bookListName_cn,
          showBack: false,
          onPressback: () {},
        ),
        body: SingleChildScrollView(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(Applayout.getHeight(16)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Author'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the author.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          author = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Category'),
                      value: category,
                      items: categories.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          category = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a category.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Wrap(
                      children: tags.map((tag) {
                        return CheckboxListTile(
                          title: Text(tag),
                          value: selectedTags.contains(tag),
                          onChanged: (checked) {
                            setState(() {
                              if (checked!) {
                                selectedTags.add(tag);
                              } else {
                                selectedTags.remove(tag);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Description'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the description.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          description = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Status'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the status.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form validation passed, create a new book object
                          Book newBook = Book(
                            author: author,
                            category: category,
                            tags: selectedTags,
                            description: description,
                            status: status,
                          );

                          // You can perform additional actions here, like saving the book to a database

                          // Display a confirmation dialog
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Book Added'),
                                content: Text(
                                    'The book has been added successfully.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text('Add Book'),
                    ),
                  ],
                ),
              ),
            )
          ),
        ));
  }
}
