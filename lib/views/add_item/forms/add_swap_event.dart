import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:swapper/net/firebase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';


class AddSwapEvent extends StatefulWidget {
  @override
  _AddSwapEventState createState() => _AddSwapEventState();
}

class _AddSwapEventState extends State<AddSwapEvent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _swaps = TextEditingController();
  TextEditingController _people = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _date = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final storage = FirebaseStorage.instance;
  final picker = ImagePicker();
  PickedFile image;

  DateTime dateTime;

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        toolbarHeight: 50,
        title: Text('Add Stuff',
            style: TextStyle(color: white, fontFamily: 'Arial')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () => imageUpload(),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(15),
                    strokeWidth: 2,
                    dashPattern: [2, 2, 2, 2],
                    color: green,
                    child: image == null
                        ? Container(
                            color: Color.fromRGBO(248, 248, 248, 1.0),
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 150,
                            child: Icon(Icons.camera_alt,
                                color: darkGreen, size: 40),
                          )
                        : Stack(children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(image.path),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Container(
                              color: Color.fromRGBO(248, 248, 248, 0),
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 150,
                              child: Icon(Icons.camera_alt,
                                  color: darkGreen, size: 40),
                            )
                          ]),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Title',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _title,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (String input) {
                            if (input.isEmpty) {
                              return 'Please enter the title of ad';
                            }
                            return null;
                          },
                          onSaved: (input) => _title.text = input,
                          decoration: InputDecoration(
                            hintText: "Gucci Bag FX45022",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 0.7),
                                fontFamily: 'Arial',
                                fontSize: 14),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(112, 112, 112, 1.0)),
                                borderRadius: BorderRadius.circular(0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                  width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Date',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.229,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                '${selectedDate.toLocal()}'.split(' ')[0],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 19,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            TextButton(
                              child: Container(
                                width: 145,
                                height: 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Pick',
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            fontFamily: 'Arial')),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: green,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              onPressed: () => {
                                pickDateTime(context),
                                selectedDate=dateTime
                                },
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Items for swap',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _description,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'PLease enter a description';
                            }
                            return null;
                          },
                          onSaved: (input) => _swaps.text = input,
                          decoration: InputDecoration(
                            hintText: "Gucci Bag FX45022",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 0.7),
                                fontFamily: 'Arial',
                                fontSize: 14),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(112, 112, 112, 1.0)),
                                borderRadius: BorderRadius.circular(0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                  width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Number of people',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _description,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'PLease enter a description';
                            }
                            return null;
                          },
                          onSaved: (input) => _people.text = input,
                          decoration: InputDecoration(
                            hintText: "Gucci Bag FX45022",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 0.7),
                                fontFamily: 'Arial',
                                fontSize: 14),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(112, 112, 112, 1.0)),
                                borderRadius: BorderRadius.circular(0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                  width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _description,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'PLease enter a description';
                            }
                            return null;
                          },
                          onSaved: (input) => _description.text = input,
                          decoration: InputDecoration(
                            hintText: "Gucci Bag FX45022",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 0.7),
                                fontFamily: 'Arial',
                                fontSize: 14),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(112, 112, 112, 1.0)),
                                borderRadius: BorderRadius.circular(0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                  width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'City',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Address',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Contacts',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextFormField(
                          controller: _contact,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (String input) {
                            if (input.isEmpty) {
                              return 'Please enter your contacts';
                            }
                            return null;
                          },
                          onSaved: (input) => _contact.text = input,
                          decoration: InputDecoration(
                            hintText: "Gucci Bag FX45022",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(112, 112, 112, 0.7),
                                fontFamily: 'Arial',
                                fontSize: 14),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(112, 112, 112, 1.0)),
                                borderRadius: BorderRadius.circular(0)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1.0),
                                  width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Charity',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        decoration: BoxDecoration(
                            color: lightGreen,
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      SizedBox(height: 25),
                      TextButton(
                          onPressed: () {
                            if (coins >= 10) {
                              addStuffData();
                            } else
                              AlertDialog(
                                  title: Text(
                                      'Insufficient quantity of swap-coins'),
                                  content: Text(
                                      'For arranging swap-event, you need 10 swap-coins. \n But you have only $coins swap-coins'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'))
                                  ]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: green,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('PUBLISH',
                                    style: TextStyle(
                                        color: white,
                                        fontFamily: 'Arial',
                                        fontSize: 15)),
                              ],
                            ),
                          )),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ]),
        ),
      )),
    );
  }

  addStuffData() {
    Map<String, dynamic> userStuff = {
      "title": "$_title",
      "description": "$_description",
      "url": "$imageURL",
      "contact": "$_contact",
      "address": "$_address",
      "city": "$_city",
      "swaps": "$_swaps",
      "people": "$_people"
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('stuff');

    collectionReference.add(userStuff);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddSwapEvent()));
  }

  imageUpload() async {
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
            TextButton(
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
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'))
        ],
      );
    }
  }
}
