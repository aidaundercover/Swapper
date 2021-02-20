import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SwapEvent {
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

  SwapEvent(
      {@required this.country,
      @required this.city,
      @required this.title,
      @required this.imageURL,
      @required this.date,
      @required this.people,
      @required this.stuff,
      @required this.address,
      this.charity,
      this.username,
      this.description,
      this.documentId
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
        'documentId' : documentId,
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
        documentId = snapshot.id;
}

final events = [
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
  SwapEvent(
      title: 'Biggest Swap event for Hat lovers',
      country: 'Russia',
      city: 'Moscow',
      imageURL: 'assets/images/dummyswap.png',
      date: '15.08.2021',
      people: 100,
      address: 'Arbat 14',
      stuff: 'hats only'),
];
