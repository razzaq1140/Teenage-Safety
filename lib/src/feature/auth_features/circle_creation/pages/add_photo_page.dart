import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class AddPhotoPage extends StatefulWidget {
  const AddPhotoPage({super.key});

  @override
  State<AddPhotoPage> createState() => _AddPhotoPageState();
}

class _AddPhotoPageState extends State<AddPhotoPage> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.backgroundOne),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: 120,
                width: 250,
                child: SvgPicture.asset(
                  AppIcons.logo,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add your photo",
                  style: textTheme(context).headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: colorScheme(context).onPrimary),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "This makes it easy for your family to find you on the map.",
                  style: textTheme(context).titleMedium?.copyWith(
                        color: colorScheme(context).outline,
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(AppImages.map),
                      height: 250,
                    ),
                    Positioned(
                      top: 25,
                      left: 85,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: colorScheme(context).outline,
                        backgroundImage:
                            _imageFile != null ? FileImage(_imageFile!) : null,
                        child: _imageFile == null
                            ? Icon(
                                Icons.person_pin_circle_outlined,
                                color: colorScheme(context).primary,
                                size: 60,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              if (_imageFile == null)
                TextButton(
                  onPressed: () {
                    _showImageSourceDialog();
                  },
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.infinity, 50),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: colorScheme(context).onSurface.withOpacity(0.4),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Click to Add your Photo',
                        style: TextStyle(
                          color: colorScheme(context).onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Create",
                  onPressed: () {
                    context.pushNamed(AppRoute.permissionRequestPage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
