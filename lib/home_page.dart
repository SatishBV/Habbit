import 'package:flutter/material.dart';
import 'Constants/styles.dart';
// import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'Views/week_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   DatePickerController _controller = DatePickerController();

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
            WeekView(onTap: (date) {},)
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
}

// DatePicker(
//               DateTime(
//                 DateTime.now().year,
//                 DateTime.now().month,
//                 DateTime.now().day - 3,
//               ),
//               height: 100.0,
//               width: 60.0,
//               daysCount: 12,
//               controller: _controller,
//               initialSelectedDate: DateTime.now(),
//               monthTextStyle: monthTextStyle,
//               dayTextStyle: dayTextStyle,
//               dateTextStyle: dateTextStyle,
//               selectionColor: purpleColor,
//               onDateChange: (date) {
//                 // New date selected
//                 setState(() {});
//               },
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Container(
//               height: 200,
//               margin: EdgeInsets.only(left: 30.0, right: 30.0),
//               color: purpleColor,
//               child: Text(
//                 'Hey',
//                 style: dateTextStyle,
//               ),
//             )