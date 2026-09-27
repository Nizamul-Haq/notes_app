import 'package:flutter/material.dart';
import 'package:notes_app/Providers/notes_provider.dart';
import 'package:notes_app/routes/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => NotesProvider(),
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
