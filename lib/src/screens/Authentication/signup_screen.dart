import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _socialsController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _shortDescriptionController = TextEditingController();
  final _tagsController = TextEditingController();

  String _userType = 'customer';
  String _partnerType = 'store';
  File? _bannerImage;
  File? _logoImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 20),
              if (_userType == 'customer') ...[
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(labelText: 'Contact'),
                ),
                SizedBox(height: 20),
              ] else ...[
                GestureDetector(
                  onTap: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _bannerImage = pickedFile as File?;
                    });
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: _bannerImage == null
                        ? Center(child: Text('Select Banner Image'))
                        : Image.file(File(_bannerImage!.path)),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _socialsController,
                  decoration: InputDecoration(labelText: 'Socials'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _shortDescriptionController,
                  decoration: InputDecoration(labelText: 'Short Description'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tagsController,
                  decoration: InputDecoration(labelText: 'Tags'),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _logoImage = pickedFile as File?;
                    });
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: _logoImage == null
                        ? Center(child: Text('Select Logo'))
                        : Image.file(File(_logoImage!.path)),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _partnerType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _partnerType = newValue!;
                    });
                  },
                  items: <String>['store', 'restaurants', 'donation centers']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Select Partner Type'),
                ),
                SizedBox(height: 20),
              ],
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _userType,
                onChanged: (String? newValue) {
                  setState(() {
                    _userType = newValue!;
                  });
                },
                items: <String>['customer', 'partner']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Select User Type'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await authService.register(
                      name: _nameController.text,
                      email: _emailController.text,
                      address: _addressController.text,
                      contact: _contactController.text,
                      password: _passwordController.text,
                      userType: _userType,
                      partnerType: _partnerType,
                      bannerImage: _bannerImage,
                      socials: _socialsController.text,
                      description: _descriptionController.text,
                      shortDescription: _shortDescriptionController.text,
                      tags: _tagsController.text,
                      logoImage: _logoImage,
                    );
                  }
                },
                child: Text('Register'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _userType = 'customer';
                      });
                    },
                    child: Text('Back'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
