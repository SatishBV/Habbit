import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class API {
  final Firestore _db = Firestore.instance;
  SharedPreferences prefs;
  CollectionReference usersCollection;

  API() {
    usersCollection = _db.collection('users');
  }

  Future<DocumentReference> getDocumentReference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString('email');

    return usersCollection.document(email); 
  }

  Future<Stream<QuerySnapshot>> getHabits() async {
    DocumentReference document = await getDocumentReference();
    var snapshots =  document.collection('habits').snapshots();
    return snapshots;
  }

  Future<CollectionReference> getHabitsCollectionReference() async {
    var document = await getDocumentReference();
    return document.collection('habits');
  }
}