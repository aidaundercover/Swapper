import 'package:swapper/models/message.dart';
import 'package:swapper/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRepository {
  final FirebaseFirestore _firestore;

  MessageRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<QuerySnapshot> getChats({userId}) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('chats')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future deleteChat({currentUserId, selectedUserId}) async {
    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('chats')
        .doc(selectedUserId)
        .delete();
  }

  Future<User> getUserDetail({userId}) async {
    User _user = User();

    await _firestore.collection('users').doc(userId).get().then((user) {
      _user.uid = user.documentID;
      _user.name = user['name'];
      _user.photo = user['photoUrl'];
      _user.location = user['location'];
    });
    return _user;
  }

  Future<Message> getLastMessage({currentUserId, selectedUserId}) async {
    Message _message = Message();

    await _firestore
        .collection('users')
        .doc(currentUserId)
        .collection('chats')
        .doc(selectedUserId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .first
        .then((doc) async {
      await _firestore
          .collection('messages')
          .doc(doc.documents.first.documentID)
          .get()
          .then((message) {
        _message.text = message['text'];
        _message.photoUrl = message['photoUrl'];
        _message.timestamp = message['timestamp'];
      });
    });

    return _message;
  }
}
