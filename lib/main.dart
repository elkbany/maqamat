import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'models/maqam.dart';
import 'providers/maqamat_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MaqamatProvider(),
      child: MaterialApp(
        title: 'المقامات الموسيقية',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF8B4513),
            brightness: Brightness.light,
          ).copyWith(
            primary: const Color(0xFF8B4513),
            secondary: const Color(0xFF5C4033),
            tertiary: const Color(0xFF8B7355),
          ),
          cardTheme: const CardTheme(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
          fontFamily: 'Noto Naskh Arabic',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            headlineSmall: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            titleLarge: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            titleSmall: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 16,
              height: 1.5,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 14,
              height: 1.5,
            ),
            bodySmall: TextStyle(
              fontFamily: 'Noto Naskh Arabic',
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF8B4513),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          fontFamily: 'Noto Naskh Arabic',
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            displayMedium: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            displaySmall: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            headlineLarge: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            headlineMedium: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            headlineSmall: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            titleLarge: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            titleMedium: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            titleSmall: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            bodyLarge: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            bodyMedium: TextStyle(fontFamily: 'Noto Naskh Arabic'),
            bodySmall: TextStyle(fontFamily: 'Noto Naskh Arabic'),
          ),
        ),
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class MaqamDetailScreen extends StatelessWidget {
  final Maqam maqam;

  const MaqamDetailScreen({
    super.key,
    required this.maqam,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(maqam.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(maqam.description),
      ),
    );
  }
}
