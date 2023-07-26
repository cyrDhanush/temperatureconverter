import 'package:flutter/material.dart';
import 'package:temperatureconverter/colors.dart';

class NumPad extends StatefulWidget {
  final Function? onChanged;
  const NumPad({super.key, this.onChanged});

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  onbuttontap(String newnum) {
    if (widget.onChanged != null) {
      widget.onChanged!(newnum);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      color: bgwhite,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          childAspectRatio: 1,
          children: [
            // first row
            CustomButton(text: '7', onTap: onbuttontap),
            CustomButton(text: '8', onTap: onbuttontap),
            CustomButton(text: '9', onTap: onbuttontap),
            CustomButton(text: 'C', onTap: onbuttontap),
            // second row
            CustomButton(text: '4', onTap: onbuttontap),
            CustomButton(text: '5', onTap: onbuttontap),
            CustomButton(text: '6', onTap: onbuttontap),
            CustomButton(
                text: 'backspace',
                onTap: onbuttontap,
                child: Icon(Icons.backspace_outlined)),
            // third row
            CustomButton(text: '1', onTap: onbuttontap),
            CustomButton(text: '2', onTap: onbuttontap),
            CustomButton(text: '3', onTap: onbuttontap),
            CustomButton(text: '+/-', onTap: onbuttontap),
            //fourth row
            CustomButton(text: '00', onTap: onbuttontap),
            CustomButton(text: '0', onTap: onbuttontap),
            CustomButton(text: '.', onTap: onbuttontap),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String text;
  final Widget? child;
  final Function? onTap;
  const CustomButton({super.key, this.text = '1', this.onTap, this.child});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool istap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // istap = true;
        // setState(() {});
        // await Future.delayed(Duration(milliseconds: 500));
        // istap = false;
        // setState(() {});
        // print('tapped');
        if (widget.onTap != null) {
          widget.onTap!(widget.text);
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            return AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 800),
              // height: (istap == true)
              //     ? (constraints.maxHeight)
              //     : (constraints.maxHeight - (constraints.maxHeight * 0.2)),
              // width: (istap == true)
              //     ? (constraints.maxWidth)
              //     : (constraints.maxWidth - (constraints.maxWidth * 0.2)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: fgwhite,
                borderRadius: BorderRadius.circular(100),
              ),
              child: (widget.child != null)
                  ? (widget.child)
                  : (Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black.withAlpha(200),
                      ),
                    )),
            );
          },
        ),
      ),
    );
  }
}
