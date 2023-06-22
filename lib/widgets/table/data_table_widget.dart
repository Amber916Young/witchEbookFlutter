import 'package:flutter/material.dart';
import 'package:witchbook/utils/app_styles.dart';

import '../header/gradient_appBar.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  // Define your data source (e.g., list of users)
  List<User> users = [
    User(id: 1, name: 'John Doe', email: 'john@example.com'),
    User(id: 2, name: 'Jane Smith', email: 'jane@example.com'),
    // Add more users
  ];

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  late int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrandientAppBar(
        showAvatar: false,
        onNavigate: () {},
        title: Styles.bookListName_cn,
        showBack: false,
        onPressback: () {
        },
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: Text('Users'),
          rowsPerPage: _rowsPerPage,
          availableRowsPerPage: [5, 10, 20], // Define available rows per page options
          onRowsPerPageChanged: (value) {
            setState(() {
              _rowsPerPage = value!;
            });
          },
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: Text('ID'),
              numeric: true,
              onSort: (columnIndex, ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  // Implement sorting logic for ID column
                  users.sort((a, b) => a.id.compareTo(b.id));
                  if (!ascending) {
                    users = users.reversed.toList();
                  }
                });
              },
            ),
            DataColumn(
              label: Text('Name'),
              onSort: (columnIndex, ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  // Implement sorting logic for Name column
                  users.sort((a, b) => a.name.compareTo(b.name));
                  if (!ascending) {
                    users = users.reversed.toList();
                  }
                });
              },
            ),
            DataColumn(
              label: Text('Email'),
              onSort: (columnIndex, ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  // Implement sorting logic for Email column
                  users.sort((a, b) => a.email.compareTo(b.email));
                  if (!ascending) {
                    users = users.reversed.toList();
                  }
                });
              },
            ),
            DataColumn(
              label: Text('Action'),
            ),
          ],
          source: UserDataSource(users), // Implement UserDataSource class
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

class UserDataSource extends DataTableSource {
  final List<User> _users;
  UserDataSource(this._users);

  @override
  DataRow getRow(int index) {
    final user = _users[index];
    return DataRow(cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.name)),
      DataCell(Text(user.email)),
      DataCell(
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Implement your action logic here when the button is clicked
            print('Edit button clicked for user ${user.id}');
          },
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _users.length;

  @override
  int get selectedRowCount => 0;
}

