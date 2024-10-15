import 'package:flutter/material.dart';

class CreateNewStatementPage extends StatefulWidget {
  @override
  _CreateNewStatementPageState createState() => _CreateNewStatementPageState();
}

class _CreateNewStatementPageState extends State<CreateNewStatementPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Statement'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title of Statement'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Short Description'),
            ),
            Row(
              children: [
                Text('Start Date: ${_startDate.toLocal()}'.split(' ')[0]),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _startDate)
                      setState(() {
                        _startDate = picked;
                      });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Create Statement'),
              onPressed: () {
                // Implement statement creation and storage functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
