import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final String _hintText;
  final Icon _icon;
  final bool _isPassword;
  final TextEditingController _textController;
  InputTextField(this._icon, this._hintText, this._textController, this._isPassword);

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;

    return Container(

      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Colors.green
          ),

          left: BorderSide(
            color: Colors.green,
          ),

          top: BorderSide(
            color: Colors.green,
          ),

          right: BorderSide(
            color: Colors.green,
          )
        )
      ),

      child: TextFormField(
        controller: _textController,
        style: TextStyle(
          color: Colors.white,
          fontSize: _height * 0.02,
        ),
        obscureText: _isPassword,
        cursorColor: Colors.green,
        autocorrect: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: _height * 0.02,
          ),
          prefixIcon: _icon,
        ),
        validator: (input) => validateInput(input),
      ),
    );
  }

  String validateInput(String input)
  {
    if(input.isEmpty)
    {
      return 'Please enter ' + _hintText;
    }
    
    else if(_hintText == "Email")
    {
      return !input.contains('@') ? 'Not a valid email' : null;
    }
   
    
    return null;
     
  }

  
}