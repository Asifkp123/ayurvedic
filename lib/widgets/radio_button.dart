import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButtonsRow extends StatefulWidget {
  @override
  _RadioButtonsRowState createState() => _RadioButtonsRowState();
}

class _RadioButtonsRowState extends State<RadioButtonsRow> {
  String selectedOption = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Radio(
              value: 'Cash',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Text('Cash'),

          ],
        ),
        Row(
          children: [
            Radio(
              value: 'Card',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Text('Card'),

          ],
        ),
        Row(
          children: [
            Radio(
              value: 'UPI',
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Text('UPI'),

          ],
        ),
      ],
    );
  }
}