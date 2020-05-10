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
      height: 55.0,
      child: Material(
        color: kWhiteColor,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Color',
                style: kPickerTitleStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: GestureDetector(
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
            ),
          ],
        ),
      ),
    );
  }
}
