import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SwapEvent {
  String uid;
  String title;
  String country;
  String city;
  String imageURL;
  String date;
  int people;
  String stuff;
  String address;
  String charity;
  String username;
  String description;
  String documentId;
  bool registered;

  SwapEvent(
      {@required this.country,
      @required this.city,
      @required this.title,
      @required this.imageURL,
      @required this.date,
      @required this.people,
      @required this.stuff,
      @required this.address,
      this.uid,
      this.charity,
      this.username,
      this.description,
      this.documentId,
      this.registered
      });

  Map<String, dynamic> toJson() => {
        'title': title,
        'country': country,
        'city': city,
        'imageURL': imageURL,
        'date': date,
        'people': people,
        'stuff': stuff,
        'address': address,
        'charity': charity,
        'username': username,
        'documentId': documentId,
        'registered' : registered,
      };

  SwapEvent.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot.data()['title'],
        username = snapshot.data()['username'],
        imageURL = snapshot.data()['imageURL'],
        address = snapshot.data()['location'],
        description = snapshot.data()['description'],
        date = snapshot.data()['date'].toDate(),
        people = snapshot.data()['people'],
        stuff = snapshot.data()['stuff'],
        charity = snapshot.data()['charity'],
        country = snapshot.data()['country'],
        registered = snapshot.data()['registered'],
        documentId = snapshot.id;
}

final events = [
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Kazakhstan',
      city: 'Almaty',
      imageURL: 'assets/images/dummyswap.png',
      date: '13.09.2021',
      people: 230,
      address: 'Arbat 14',
      stuff: 'hats only',
      registered: false,
      ),
  SwapEvent(
      title: 'Swap event for vintage items!',
      country: 'Kazakhstan',
      city: 'Pavlodar',
      imageURL: 'assets/images/event1.png',
      date: '09.06.2021',
      people: 100,
      address: 'Nazarbayeva 35',
      stuff: 'vintage clothes',
      registered: false,
      ),
  SwapEvent(
      title: 'T-T-T-Shirt swap-event in PVL',
      country: 'Kazakhstan',
      city: 'Pavlodar',
      imageURL: 'assets/images/event2.png',
      date: '24.05.2021',
      people: 150,
      address: 'Mairy 15',
      stuff: 't-shirts',
      registered: false,
      ),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Kazakhstan',
      city: 'Nus-Sultan',
      imageURL: 'assets/images/event3.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only',
      registered: false,
      ),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Kazakhstan',
      city: 'Kostanai',
      imageURL: 'assets/images/event4.jpg',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only',
      registered: false,
      ),
  SwapEvent(
      title: 'QazaqRepublic&Ecology',
      country: 'Kazakhstan',
      city: 'Almaty',
      imageURL: 'assets/images/event5.jpg',
      date: '15.08.2021',
      people: 600,
      address: 'B.Momyshuly 89B',
      stuff: 'QR clothes',
      registered: false,
      ),
  SwapEvent(
      title: 'Long Fashino Show',
      country: 'Russia',
      city: 'Omsk',
      imageURL: 'assets/images/event6.jpg',
      date: '13.05.2021',
      people: 80,
      address: 'Lenin 84',
      stuff: 'everything',
      registered: false,
      ),

];

