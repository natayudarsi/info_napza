import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, content, btnText;
  final GestureTapCallback btnPressed;

  CustomDialog({
    @required this.title,
    @required this.content,
    @required this.btnText,
    @required this.btnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          // Bottom rectangular box
          margin:
              EdgeInsets.only(top: 40), // to push the box half way below circle
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  color: title == 'Salah' ? Colors.red : Colors.teal,
                  width: 2)),
          padding: EdgeInsets.only(
              top: 60, left: 20, right: 20), // spacing inside the box
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: title == 'Salah' ? Colors.red : Colors.teal),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                content,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              ButtonBar(
                buttonMinWidth: 100,
                alignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      btnText,
                      style: TextStyle(
                          fontSize: 18,
                          color: title == 'Salah' ? Colors.red : Colors.teal),
                    ),
                    onPressed: btnPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
        CircleAvatar(
          // Top Circle with icon
          maxRadius: 40.0,
          child: Icon(
            title == 'Salah'
                ? const IconData(58829, fontFamily: 'MaterialIcons')
                : const IconData(58826, fontFamily: 'MaterialIcons'),
            size: 40,
            color: Colors.white,
          ),
          backgroundColor: title == 'Salah' ? Colors.red : Colors.teal,
        ),
      ],
    );
  }
}
