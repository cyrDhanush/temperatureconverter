import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temperatureconverter/colors.dart';

class TempBox extends StatefulWidget {
  final String text;
  final int? boxno;
  final int? currentbox;
  final Function? onToggle;
  const TempBox(
      {super.key, this.text = '', this.boxno, this.currentbox, this.onToggle});

  @override
  State<TempBox> createState() => _TempBoxState();
}

class _TempBoxState extends State<TempBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onToggle != null) {
          widget.onToggle!(widget.boxno);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
        decoration: BoxDecoration(
          color: fgwhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: Colors.black,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Degree Celcius (C)',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withAlpha(150),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.black.withAlpha(100),
                    size: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  // '1234',
                  widget.text,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: (widget.currentbox == widget.boxno)
                        ? (Colors.orange)
                        : (Colors.black.withAlpha(100)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
