import 'dart:io';
import 'package:charityapp/screens/donors_screen.dart';
import 'package:charityapp/screens/root_page.dart';
import 'package:charityapp/widgets/custom_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class DonationForm extends StatefulWidget {
  static const String id = 'donation_form';
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = new GlobalKey<FormState>();
  File _imageFile;
  String _uploadedImageURL;
  String _itemName = 'item1';
  String _quantity;
  String _donorName;
  String _contactNumber;
  String _address;
  String _image;
  bool _isLoading;

  @override
  void initState() {
    _isLoading = false;
    super.initState();
  }

  void alertUser(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  _formKey.currentState.reset();
                },
              )
            ],
          );
        });
  }

  Future uploadImage() async {
    String fileName = Path.basename(_imageFile.path);
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child('images').child(fileName);
    StorageUploadTask uploadTask = reference.putFile(_imageFile, StorageMetadata(contentType: 'image/jpeg'));
    await uploadTask.onComplete;
    print('File Uploaded');
    reference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedImageURL = fileURL;
      });
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    if (_imageFile == null) {
      alertUser('Alert', 'No image selected.');
      return;
    }
    setState(() {
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        await uploadImage();
        setState(() {
          _isLoading = false;
          _imageFile = null;
          alertUser('Success', 'Thank you for making a donation!');
        });
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          alertUser('Error', e.message);
          _formKey.currentState.reset();
        });
      }
    }
  }

  Future getImage(bool isCamera) async {
    PickedFile image;
    if (isCamera) {
      image = await ImagePicker().getImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().getImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Donation Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF5D637A),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          _showCircularProgress(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: 400,
                child: Text(
                  'Add an item to the donation list',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    showFormField('Item Name', 1),
                    showFormField('Quantity', 2),
                    showFormField('Donor Name', 3),
                    showFormField('Contact Number', 4),
                    showFormField('Location', 5),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          _imageFile == null ? 'Choose Photo' : 'Change photo',
                          style: TextStyle(fontWeight: FontWeight.bold, color: _imageFile == null ? Colors.black : Colors.blue),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () {
                            getImage(true);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add_photo_alternate),
                          onPressed: () {
                            getImage(false);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                    CustomButton(
                      buttonName: 'Submit',
                      onPressed: () {
                        validateAndSubmit();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showFormField(String name, int type) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: TextFormField(
        autofocus: false,
        style: TextStyle(fontSize: 15.0, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: name,
          filled: true,
          fillColor: Colors.white70,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38),
              borderRadius: BorderRadius.zero),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.zero),
        ),
        validator: (value) => value.isEmpty ? "can\'t be empty" : null,
        onTap: () {
          setState(() {
            _isLoading = false;
          });
        },
        onSaved: (value) {
          switch (type) {
            case 1:
              _itemName = value;
              break;
            case 2:
              _quantity = value;
              break;
            case 3:
              _donorName = value;
              break;
            case 4:
              _contactNumber = value;
              break;
            case 5:
              _address = value;
              break;
          }
        },
      ),
    );
  }
}
