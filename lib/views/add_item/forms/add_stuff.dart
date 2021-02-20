import 'package:flutter/material.dart';
import 'package:swapper/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:swapper/net/firebase.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:swapper/views/add_item/categories.dart';

class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues})
      : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        selectedValues.add(itemValue);
      } else {
        selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Prefered Swaps category',
        style: TextStyle(fontSize: 14),
      ),
      contentPadding: EdgeInsets.only(top: 7.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}

////////////////////////////////////////////////////

class AddStuff extends StatefulWidget {
  @override
  _AddStuffState createState() => _AddStuffState();
}

class _AddStuffState extends State<AddStuff> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _contact = TextEditingController();

  List<MultiSelectDialogItem<int>> multiItem = List();

  final valuestopopulate = {
    1: "Children Stuff",
    2: "Electronics",
    3: "Fashion and Style",
    4: "Hobbies and Sport",
    5: "Home and Garden",
    6: "Transport",
    7: "Real Estate"
  };

  void populateMultiselect() {
    for (int v in valuestopopulate.keys) {
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]));
    }
  }

  void _showMultiSelect(BuildContext context) async {
    multiItem = [];
    populateMultiselect();
    final items = multiItem;
    // final items = <MultiSelectDialogItem<int>>[
    //   MultiSelectDialogItem(1, 'India'),
    //   MultiSelectDialogItem(2, 'USA'),
    //   MultiSelectDialogItem(3, 'Canada'),
    // ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: [].toSet(),
        );
      },
    );

    print(selectedValues);
    getvaluefromkey(selectedValues);
  }

  void getvaluefromkey(Set selection) {
    if (selection != null) {
      for (int x in selection.toList()) {
        print(valuestopopulate[x]);
      }
    }
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
                    child: Container(
                      color: Color.fromRGBO(248, 248, 248, 1.0),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 150,
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
                          validator: (input) {},
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
                                borderSide:
                                    BorderSide(color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Category',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryList()));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: lightGreen,
                                  borderRadius: BorderRadius.circular(7)))),
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
                        height: 120,
                        child: TextFormField(
                          controller: _description,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Arial',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          validator: (input) {},
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
                                borderSide:
                                    BorderSide(color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Prefered Swaps',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Arial',
                                color: Color.fromRGBO(112, 112, 112, 1.0)),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      FlatButton(
                          onPressed: () {
                            _showMultiSelect(context);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: lightGreen,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Choose',
                                    style: TextStyle(
                                      color: darkGreen,
                                    ),
                                  ),
                                ],
                              ))),
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
                          validator: (input) {},
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
                                borderSide:
                                    BorderSide(color: Colors.red[600], width: 2)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red[600], width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      FlatButton(
                          onPressed: () {
                            addStuffData();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(10)
                            ),
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
      "contacts": "$_contact",
    };

    CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('stuff');

  collectionReference.add(userStuff);
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
