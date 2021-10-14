// FireStore Connection Setup

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('todos');

class Database {
  static String? userId;

  // To Add data to Firestore
  static Future<void> addItem({
    required String title,
    required DateTime dateTime,
    required bool isDone,
  }) async {
    print('this is Id : $userId   check');
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'dateTime': dateTime,
      'isDone': isDone,
    };
    await documentReference
        .set(data)
        .whenComplete(() => print('Item stored on database'))
        .catchError((e) => print(e));
  }

  // To Update data to Firestore
  static Future<void> updateItem({
    required String title,
    required DateTime dateTime,
    required bool isDone,
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'dateTime': dateTime,
      'isDone': isDone,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print('Item updated on database'))
        .catchError((e) => print(e));
  }


  // To Read data from Firestore
  static Stream<QuerySnapshot> readItem() {
    CollectionReference todosItemCollection =
        _mainCollection.doc(userId).collection('items');
    return todosItemCollection.snapshots();
  }


  // To Delete data from Firestore
  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('Item deleted from database'))
        .catchError((e) => print(e));
  }
}
