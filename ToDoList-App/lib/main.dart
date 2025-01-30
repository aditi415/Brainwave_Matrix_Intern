import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:task1/todo_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBe31gsuo-HBYQFJiUKV5YKuL0j5XQYG2Y",
        authDomain: "todolist-bb8cd.firebaseapp.com",
        projectId: "todolist-bb8cd",
        storageBucket: "todolist-bb8cd.firebasestorage.app",
        messagingSenderId: "859359050708",
        appId: "1:859359050708:web:4c48160d138ad87b75b441"
    )
  );
}else{
  await Firebase.initializeApp();
} 
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ToDoScreen(),
    );
  }
}
