import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:habbit/Constants/styles.dart';

class ColorPickerCard extends StatelessWidget {
  ColorPickerCard({@required this.activeColor, this.onColorChanged});

  final Color activeColor;
  final Function onColorChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 167.0,
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Color',
            style: kPickerTitleStyle,
          ),
          SizedBox(
            width: 20.0,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select a color'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: activeColor,
                        onColorChanged: onColorChanged,
                        availableColors: availableColors,
                      ),
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              backgroundColor: activeColor,
              radius: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
