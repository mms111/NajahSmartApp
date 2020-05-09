import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final String _hintText;
  final Icon _icon;
  final bool _isPassword;
  final TextEditingController _textController;
  final TextInputType _textInputType;
  InputTextField(this._icon, this._hintText, this._textController, this._isPassword,this._textInputType);

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;

    return Container(

      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: Colors.green
        )
      ),

      child: TextFormField(
        textAlignVertical: TextAlignVertical(y: 0.1),
        controller: _textController,
        keyboardType: _textInputType,
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