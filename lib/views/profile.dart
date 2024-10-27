import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:hacktoberxmlsa_app/providers/userProfile.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';
import 'package:hacktoberxmlsa_app/widgets/button.dart';
import 'package:hacktoberxmlsa_app/widgets/textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Provider.of<UserProfileProvider>(context, listen: false)
          .updateProfileImage(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: userProfile.profileImage != null
                        ? FileImage(userProfile.profileImage!)
                        : NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnDNmpgYnTP4ELmIob69uKE1O0Rbrotna00g&s')
                            as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Name", style: TextStyle(fontSize: 15)),
              CustomTextField(
                controller: nameController,
                onChanged: (value) {
                  userProfile.updateName(value);
                },
              ),
              SizedBox(height: 20),
              Text("Roll No.", style: TextStyle(fontSize: 15)),
              CustomTextField(
                controller: rollController,
                onChanged: (value) {
                  userProfile.updateRoll(value);
                },
              ),
              SizedBox(height: 20),
              Text("Email", style: TextStyle(fontSize: 15)),
              CustomTextField(
                controller: emailController,
                onChanged: (value) {
                  userProfile.updateEmail(value);
                },
              ),
              SizedBox(height: 20),
              Text("Password", style: TextStyle(fontSize: 15)),
              CustomTextField(controller: passwordController),
              SizedBox(height: 40),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                text: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }  
}