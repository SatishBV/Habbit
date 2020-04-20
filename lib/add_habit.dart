import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants/styles.dart';
import 'Models/habit.dart';

class CreateHabbit extends StatefulWidget {
  final Function onSave;
  static String id = 'CreateHabbit';

  CreateHabbit({@required this.onSave});

  @override
  _CreateHabitState createState() => _CreateHabitState();
}

class _CreateHabitState extends State<CreateHabbit> {
  Habit habit;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    habit = Habit(title: 'Yoga');
    habit.description = 'Get flexing';

    return Scaffold(
      backgroundColor: kGreenColor,
      appBar: AppBar(
        backgroundColor: kGreenColor,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: textColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Container(
              alignment: Alignment.centerLeft,
              child:
                  Text('Create a\nnew Habbit', style: kAddHabitPageTitleLabel),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                height: 500.0,
                decoration: BoxDecoration(
                  color: kCardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 30.0,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              controller: _textEditingController,
                              style: kTextFieldPlaceHolderLabel,
                              decoration: InputDecoration(
                                labelStyle: kTextFieldPlaceHolderLabel,
                                labelText: 'Name',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textColor,
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(bottom: 6.0),
                              ),
                              onSubmitted: (String value) {}),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
