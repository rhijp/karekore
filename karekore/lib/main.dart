import 'package:flutter/material.dart';

class EventInputPage extends StatefulWidget {
  @override
  _EventInputPageState createState() => _EventInputPageState();
}

class _EventInputPageState extends State<EventInputPage> {
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _eventController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('予定の入力'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'どんな予定ですか？',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                hintText: '予定の内容を入力してください',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '日時はいつですか？',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: '日時を入力してください (例: 2023/10/31 14:00)',
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 入力内容を取得して、次の処理に渡す
                  final event = _eventController.text;
                  final date = _dateController.text;
                  
                  // 入力内容を確認 (ここで他のページに遷移するなどの処理を追加できます)
                  if (event.isNotEmpty && date.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('予定が保存されました: $event, $date'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('すべての項目を入力してください'),
                      ),
                    );
                  }
                },
                child: Text('保存'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
