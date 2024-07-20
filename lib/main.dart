import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_push_notification/database_services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                createRecord();
              },
              color: Colors.amber,
              child: const Text("Add Data"),
            ),
            MaterialButton(
              onPressed: () {
                readData();
              },
              color: Colors.amber,
              child: const Text("Read Data"),
            ),
            MaterialButton(
              onPressed: () {
                updateData();
              },
              color: Colors.amber,
              child: const Text("Update Data"),
            ),
            MaterialButton(
              onPressed: () {
                deleteData();
              },
              color: Colors.amber,
              child: const Text("Delete Record"),
            ),
            MaterialButton(
              onPressed: () {
                searchByName('John Doe');
              },
              color: Colors.amber,
              child: const Text("Search By Name"),
            )
          ],
        ),
      ),
    );
  }
}
