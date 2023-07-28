import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperatureconverter/colors.dart';
import 'package:temperatureconverter/processor/helper.dart';
import 'package:temperatureconverter/providers/uidata.dart';

class TempBox extends StatefulWidget {
  final int? boxno;
  final Function? onToggle;
  final String text;
  const TempBox({super.key, this.boxno, this.onToggle, this.text = ''});

  @override
  State<TempBox> createState() => _TempBoxState();
}

class _TempBoxState extends State<TempBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<DataElementsProvider>(context, listen: false)
            .toggleBox(widget.boxno!);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
        decoration: BoxDecoration(
          color: fgwhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                String unit = await getUnit(context: context);
                if (unit != '') {
                  Provider.of<DataElementsProvider>(context, listen: false)
                      .changeUnits(boxno: widget.boxno!, unit: unit);
                }
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: Colors.black,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ((widget.boxno == 1)
                        ? (Provider.of<DataElementsProvider>(context).unit1)
                        : (Provider.of<DataElementsProvider>(context).unit2)),
                    style: TextStyle(
                      fontSize: 16,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: (Provider.of<DataElementsProvider>(context,
                                    listen: true)
                                .currentbox ==
                            widget.boxno)
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
