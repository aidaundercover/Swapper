import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserStuff {
  String uid;
  String title;
  String username;
  String category;
  String imgUrl;
  String location;
  String description;
  List preferedSwaps;
  String publishDate;
  String documentId;
  bool isLiked;
  bool isSwipedOff;

  UserStuff({
    @required this.title,
    @required this.username,
    @required this.category,
    @required this.description,
    @required this.imgUrl,
    @required this.location,
    this.uid,
    this.preferedSwaps,
    this.publishDate,
    this.isLiked = false,
    this.isSwipedOff = false,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'username': username,
        'category': category,
        'imgUrl': imgUrl,
        'location': location,
        'description': description,
        'preferedSwaps': preferedSwaps,
        'publishDate': publishDate,
        'documentId': documentId,
      };

  UserStuff.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot.data()['title'],
        username = snapshot.data()['username'],
        category = snapshot.data()['category'],
        imgUrl = snapshot.data()['imgUrl'],
        location = snapshot.data()['location'],
        description = snapshot.data()['description'],
        preferedSwaps = snapshot.data()['preferedSwaps'],
        publishDate = snapshot.data()['publishDate'].toDate(),
        documentId = snapshot.id;
}

final dummyStuff = [
  UserStuff(
      title: 'Fendi T-Shirt',
      username: 'Henry Champs',
      category: 'Fashion',
      description:
          'Was worn only twice, aproximately new, size is\n Medium, were bought in USA,orignal',
      imgUrl: 'assets/images/fendi.png',
      location: "Pavlodar, Kazakhstan",
      preferedSwaps: ['Fashion', 'Hobby', 'Home&Garden']),
  UserStuff(
      title: 'Nike Air Jordan 1',
      username: 'Aisha Maksut',
      category: 'Fashion',
      description:
          'In perfect state, bought it to my husband, \n but they dont fit',
      imgUrl: 'assets/images/jordans.png',
      location: "Nur-Sultan, Kazakhstan",
      preferedSwaps: ['Fashion', 'Hobby', 'Home&Garden']),
  UserStuff(
      title: 'NIKE FG456 Boots 1 year use only',
      username: 'Igor',
      category: 'Fashion',
      description:
          'In perfect state, size is 11 inch, \n were bought in USA,orignal',
      imgUrl: 'assets/images/boots.jpg',
      location: "Tver', Russia",
      preferedSwaps: ['Fashion', 'Hobby', 'Home&Garden']),
  UserStuff(
      title: 'Skateboard CHANEL limited edition',
      username: 'Samuel',
      category: 'Transport',
      description:
          'In perfect state, size is 11 inch, \n were bought in USA,orignal',
      imgUrl: 'assets/images/chanelboard.png',
      location: "Tver', Russia",
      preferedSwaps: ['Fashion', 'Hobby', 'Home&Garden']),
  UserStuff(
      title: 'Checkered coat for autumn',
      username: 'Igor',
      category: 'Fashion',
      description:
          'In perfect state, size is 11 inch, \n were bought in USA,orignal',
      imgUrl: 'assets/images/coat.jpg',
      location: "Tver', Russia",
      preferedSwaps: ['Fashion', 'Hobby', 'Home&Garden']),
  UserStuff(
      title: 'CONTRAST T-shirt 100% cotton',
      username: 'Semen',
      category: 'Fashion',
      description:
          'In perfect state, size is 11 inch, \n were bought in USA,orignal',
      imgUrl: 'assets/images/contrast.jpg',
      location: "Tver', Russia",
      preferedSwaps: ['Fashion', 'Hobby', 'Home&Garden']),
];

