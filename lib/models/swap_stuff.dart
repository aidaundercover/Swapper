import 'package:flutter/cupertino.dart';

class UserStuff {
  final String title;
  final String username;
  final String category;
  final String imgUrl;
  final String location;
  final String description;
  final String preferedSwaps;
  bool isLiked;
  bool isSwipedOff;

  UserStuff({
    @required this.title,
    @required this.username,
    @required this.category,
    @required this.description,
    @required this.imgUrl,
    @required this.location,
    @required this.preferedSwaps,
    this.isLiked = false,
    this.isSwipedOff = false,
  });
}

final dummyStuff = [
  UserStuff(
    title: 'NIKE FG456 Boots 1 year use only',
    username: 'Igor',
    category: 'Fashion',
    description: 'In perfect state, size is 11 inch, \n were bought in USA,orignal',
    imgUrl: 'assets/images/boots.jpg',
    location: "Tver', Russia",
    preferedSwaps: 'Fashion, Hobby, Home&Garden'
  ),
  UserStuff(
    title: 'NIKE FG456 Boots 1 year use only',
    username: 'Igor',
    category: 'Fashion',
    description: 'In perfect state, size is 11 inch, \n were bought in USA,orignal',
    imgUrl: 'assets/images/boots.jpg',
    location: "Tver', Russia",
    preferedSwaps: 'Fashion, Hobby, Home&Garden'
  ),
  UserStuff(
    title: 'NIKE FG456 Boots 1 year use only',
    username: 'Igor',
    category: 'Fashion',
    description: 'In perfect state, size is 11 inch, \n were bought in USA,orignal',
    imgUrl: 'assets/images/boots.jpg',
    location: "Tver', Russia",
    preferedSwaps: 'Fashion, Hobby, Home&Garden'
  ),
  UserStuff(
    title: 'NIKE FG456 Boots 1 year use only',
    username: 'Igor',
    category: 'Fashion',
    description: 'In perfect state, size is 11 inch, \n were bought in USA,orignal',
    imgUrl: 'assets/images/boots.jpg',
    location: "Tver', Russia",
    preferedSwaps: 'Fashion, Hobby, Home&Garden'
  ),
  UserStuff(
    title: 'NIKE FG456 Boots 1 year use only',
    username: 'Igor',
    category: 'Fashion',
    description: 'In perfect state, size is 11 inch, \n were bought in USA,orignal',
    imgUrl: 'assets/images/boots.jpg',
    location: "Tver', Russia",
    preferedSwaps: 'Fashion, Hobby, Home&Garden'
  ),
  UserStuff(
    title: 'NIKE FG456 Boots 1 year use only',
    username: 'Igor',
    category: 'Fashion',
    description: 'In perfect state, size is 11 inch, \n were bought in USA,orignal',
    imgUrl: 'assets/images/boots.jpg',
    location: "Tver', Russia",
    preferedSwaps: 'Fashion, Hobby, Home&Garden'
  ),
];

