import 'package:flutter/material.dart';
import 'artifact_home_page.dart';

void main() {
  runApp(const ArcheoAIApp());
}

class ArcheoAIApp extends StatelessWidget {
  const ArcheoAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArcheoAI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8D6E63),
          primary: const Color(0xFF8D6E63),
          secondary: const Color(0xFF5D4037),
          surface: const Color(0xFFF5E6CA),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5E6CA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8D6E63),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const ArtifactHomePage(),
    );
  }
}
