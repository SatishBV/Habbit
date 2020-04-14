import 'package:flutter/material.dart';
import 'Constants/styles.dart';
import 'Views/week_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            WeekView(
              onTap: onDateSelection,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: purpleColor,
        elevation: 6,
        onPressed: () {},
      ),
    );
  }

  void onDateSelection(DateTime dateTime) {
    print(dateTime.year.toString());
	print(dateTime.day.toString());
  }
}