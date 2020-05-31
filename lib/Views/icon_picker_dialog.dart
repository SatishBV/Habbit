import 'package:flutter/material.dart';
import 'package:habbit/Constants/activity_icons.dart';

class IconPicker extends StatefulWidget {
  final Color accentColor;
  final ActivityIcon currentIcon;
  final Function onIconChanged;

  IconPicker({
    this.accentColor,
    @required this.currentIcon,
    @required this.onIconChanged,
  });

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  ActivityIcon currentIcon;

  @override
  void initState() {
    super.initState();
    currentIcon = widget.currentIcon;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select an icon'),
      content: SingleChildScrollView(
        child: Container(
          width: 350.0,
          height: 360.0,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: List.generate(
              ActivityIcon.values.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIcon = ActivityIcon.values[index];
                      widget.onIconChanged(currentIcon);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: ActivityIcon.values[index] == currentIcon
                            ? Colors.black
                            : widget.accentColor,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: widget.accentColor,
                      child: Image(
                        image: AssetImage(ActivityIcon.values[index].imagePath),
                        width: 35.0,
                        height: 35.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("Close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
