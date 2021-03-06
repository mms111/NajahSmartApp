import 'package:flutter/material.dart';
import 'package:najah_smartapp/CustomWidgets/AlertDialogBox.dart';
import 'package:najah_smartapp/CustomWidgets/InputTextField.dart';
import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:najah_smartapp/View/Customer/EditProfileSplashScreen.dart';

class CustomerEditProfile extends StatefulWidget {
  
  final Customer _customer;
  CustomerEditProfile(this._customer);

  @override
  _CustomerEditProfileState createState() => _CustomerEditProfileState();
}

class _CustomerEditProfileState extends State<CustomerEditProfile> {
  
  File _image;
  final _editProfileFormKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: widget._customer.name);
    _phoneController = new TextEditingController(text: widget._customer.phone);
  }

  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;

      });
    }
    
    
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Edit Profile"
          ),
          centerTitle: true,
        ),
        
        body: Center(
          child: Container(
            width: _width * 0.9,
            height: _height * 0.7,
            child: Form(
              key: _editProfileFormKey,
              child: ListView(
                
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.green,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 145.0,
                              height: 145.0,
                              child: (_image!=null)?Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ):Image.network(
                                widget._customer.photoUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.photo_camera,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: _height * 0.05,
                  ),

                  InputTextField(
                    Icon(Icons.person, color: Colors.green,),
                    "Name",
                    _nameController,
                    false,
                    TextInputType.text
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: InputTextField(
                        Icon(Icons.phone, color: Colors.green,),
                        "Phone No", 
                        _phoneController, 
                        false,
                        TextInputType.number,
                      ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: ButtonTheme(
                        minWidth: _width * 0.35,
                        height: _height * 0.06,
                        child: RaisedButton(
                          child: Text(
                            "Update",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            
                            if(_editProfileFormKey.currentState.validate())
                            {
                              if(_image==null && 
                                 _nameController.text == widget._customer.name && 
                                 _phoneController.text == widget._customer.phone)
                              {
                                 return AlertDialogBox(context, "Alert!", "You didn't change anything.");
                              }
                              
                              else
                              {
                                Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => EditProfileSplashScreen(
                                  _image,widget._customer, _nameController.text, _phoneController.text)));
                              }
                             

                            }
                          }
                        ),
                      ),
                    ),
                  )

                ],

              ),
            ),
          ),
        )
        
      ),
    );
  }
}
