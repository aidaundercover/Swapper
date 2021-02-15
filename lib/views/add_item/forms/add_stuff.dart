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


class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues}) : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Country'),
      contentPadding: EdgeInsets.only(top: 12.0),
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
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}

//////////////////////////



class AddStuff extends StatefulWidget {
  @override
  _AddStuffState createState() => _AddStuffState();
}

class _AddStuffState extends State<AddStuff> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _contact = TextEditingController();

  List <MultiSelectDialogItem<int>> multiItem = List();

  final valuestopopulate = {
    1 : "India",
    2 : "Britain",
    3 : "Russia",
    4 : "Canada",
  };

  void populateMultiselect(){
    for(int v in valuestopopulate.keys){
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
          initialSelectedValues: [1,2].toSet(),
        );
      },
    );

    print(selectedValues);
    getvaluefromkey(selectedValues);
  }

  void getvaluefromkey(Set selection){
    if(selection != null){
      for(int x in selection.toList()){
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
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Arial'
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    child: TextFormField(
                      controller: _title,
                      keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Arial',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    validator: (input) {
                                      
                                    },
                                    onSaved: (input) =>
                                        _title.text = input,
                                    decoration: InputDecoration(
                                      hintText: 'Title',
                                      hintStyle: TextStyle(
                                          color: lightGreen,
                                          fontFamily: 'Arial',
                                          fontSize: 14),
                                      filled: false,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: lightGreen),
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: lightGreen, width: 2),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[600],
                                              width: 2)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red[600],
                                              width: 2)),
                                    ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Arial'
                    )
                  ),
                  FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  CategoryList()));
                  }, 
                  child: Container()
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Arial'
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    child: TextFormField(
                      controller: _description,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Prefered Swaps',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Arial'
                    )
                  ),
                  FlatButton(
                    onPressed: () {

                    },
                    child: Container()
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Contacts',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Arial'
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.22,
                    child: TextFormField(
                      controller: _contact
                    ),
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    onPressed: () {
                    _showMultiSelect(context);
                    },
                  child: Text(
                    'Publish',
                    style: TextStyle(
                    color: white, 
                    fontFamily: 'Arial',
                    fontSize:15
                    )
                  ))
                ],
              ),
            ),
          ])),
    );
  }

  addData() {
    Map<String,dynamic> userStuff = {"title" : "$_title"};
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
