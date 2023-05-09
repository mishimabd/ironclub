import 'package:flutter/material.dart';
import 'main.dart';
import 'settings.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileImageAndButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: Center(
              child:
              Container(
                width: 200,
                height: 200,
                child: Icon(Icons.add_a_photo),
              )
          ),
        ),
      ],
    );
  }
}
class ProfileImageAndButton extends StatefulWidget {


  @override
  _ProfileImageAndButtonsState createState() => _ProfileImageAndButtonsState();
}

class _ProfileImageAndButtonsState extends State<ProfileImageAndButton> {
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: Center(
            child: InkWell(
              onTap: () async {
                await _pickImage();
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                  image: _imageFile != null
                      ? DecorationImage(
                    image: FileImage(_imageFile!),
                    fit: BoxFit.cover,
                  )
                      : null,
                ),
                child: _imageFile == null
                    ? Icon(
                  Icons.add_a_photo,
                  size: 40,
                  color: Colors.grey[800],
                )
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
TextEditingController _nameController = TextEditingController();
TextEditingController _surnameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _ageController = TextEditingController();
TextEditingController _heightController = TextEditingController();
TextEditingController _weightController = TextEditingController();

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(''),
        iconTheme: IconThemeData(
          color: Colors.black, // Установите желаемый цвет здесь
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );// Действия при нажатии на кнопку
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // added SingleChildScrollView here
        child: Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileImageAndButtons(),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: _nameController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _nameController.clear();
                      },
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: _surnameController,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: 'Surname',
                    hintText: 'Enter your surname',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: _surnameController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _surnameController.clear();
                      },
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: 'Age',
                    hintText: 'Enter your age',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: _ageController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _ageController.clear();
                      },
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  maxLength: 40,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.mail),
                    suffixIcon: _emailController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _emailController.clear();
                      },
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: 'Height',
                    hintText: 'Enter your height',
                    prefixIcon: Icon(Icons.height),
                    suffixIcon: _heightController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _heightController.clear();
                      },
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(
                width: 320,
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    labelText: 'Weight',
                    hintText: 'Enter your weight',
                    prefixIcon: Icon(Icons.monitor_weight),
                    suffixIcon: _weightController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _weightController.clear();
                      },
                    )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

