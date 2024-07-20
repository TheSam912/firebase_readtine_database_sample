import 'package:firebase_database/firebase_database.dart';

void createRecord() {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.ref().child('users');

  databaseReference.push().set({
    'name': 'John Doe',
    'email': 'johndoe@example.com',
    'age': 30,
  });
}

void readData() {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.ref().child('users');

  databaseReference.onValue.listen((event) {
    DataSnapshot dataSnapshot = event.snapshot;
    Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;
    values.forEach((key, values) {
      print('Key: $key');
      print('Name: ${values['name']}');
      print('Email: ${values['email']}');
      print('Age: ${values['age']}');
    });
  });
}

void updateData() {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.ref().child('users');

  String recordKey = '-O1fXqPNF-GkJNoK_QGW'; // Replace with your record key

  databaseReference.child(recordKey).update({
    'name': 'Sam Nolan',
    'age': 25,
  });
}

void deleteData() {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.ref().child('users');

  String recordKey = '-O1fXqPNF-GkJNoK_QGW'; // Replace with your record key

  databaseReference.child(recordKey).remove();
}

void searchByName(String name) {
  DatabaseReference databaseReference =
  FirebaseDatabase.instance.ref().child('users');

  databaseReference
      .orderByChild('name')
      .equalTo(name)
      .onValue
      .listen((event) {
    DataSnapshot dataSnapshot = event.snapshot;
    Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;
    values.forEach((key, values) {
      print('Key: $key');
      print('Name: ${values['name']}');
      print('Email: ${values['email']}');
      print('Age: ${values['age']}');
    });
  });
}