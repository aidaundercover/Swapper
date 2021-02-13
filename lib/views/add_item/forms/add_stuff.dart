import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:swapper/net/firebase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:swapper/views/add_item/categories.dart';
import 'package:swapper/models/SwapEvent.dart';

class AddStuff extends StatefulWidget {
  @override
  _AddStuffState createState() => _AddStuffState();
}

class _AddStuffState extends State<AddStuff> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            SizedBox(height: 5),
            GestureDetector(
              onTap: () => imageUpload,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(15),
                dashPattern: [2, 2, 2, 2],
                color: green,
                child: Container(
                  color: Color.fromRGBO(248, 248, 248, 1.0),
                  width: MediaQuery.of(context).size.width / 1.22,
                  height: 100,
                  child: Icon(Icons.camera_alt, color: darkGreen, size: 40),
                ),
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    child: TextFormField(),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryList()));
                  }, 
                  child: null),
                  SizedBox(height: 15),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    child: TextFormField(),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ])),
    );
  }

  imageUpload() async {
    final storage = FirebaseStorage.instance;
    final picker = ImagePicker();
    PickedFile image;

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = await picker.getImage(source: ImageSource.gallery);

      var file = File(image.path);

      if (image != null) {
        var snapshot =
            await storage.ref().child('folderName/fileName').putFile(file);

        var downloadURL = await snapshot.ref.getDownloadURL();
        setState(() {
          imageURL = downloadURL;
        });
      } else {
        return AlertDialog(
          title: Text('Path is required'),
          content: Text('Grant permission for access to gellery'),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        );
      }
    } else {
      return AlertDialog(
        title: Text('Permissiom is denied'),
        content: Text('Grant permission for access to gellery'),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'))
        ],
      );
    }
  }
}
