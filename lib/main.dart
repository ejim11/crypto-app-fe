import 'package:crypto_app/providers/auth_provider.dart';
import 'package:crypto_app/screens/auth/login_screen.dart';
import 'package:crypto_app/screens/auth/register_screen.dart';
import 'package:crypto_app/screens/home/home_screen.dart';
import 'package:crypto_app/screens/welcome/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// App color constants
class AppColors {
  static const primary = Color(0xFF5D00C0); // Button color
  static const lightPurple = Color(0xFFF3EBFF); // Light text/backgrounds
  static const darkText = Color(0xFF191C38); // Most text
  static const mediumGray = Color(0xFF969696); // Secondary text
  static const lightGray = Color(0xFFB2B2B2); // Tertiary text
}

// choosing a color scheme for light mode
var kColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.primary,
  primary: AppColors.primary,
  surface: Colors.white,
  onSurface: AppColors.darkText,
  secondary: AppColors.lightPurple,
  onSecondary: AppColors.mediumGray,
  tertiary: AppColors.mediumGray,
  onTertiary: AppColors.lightGray,
  primaryContainer: AppColors.lightPurple,
  onPrimary: Colors.white,
);

// choosing a color scheme for dark mode
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: AppColors.primary,
  primary: AppColors.primary,
  surface: const Color(0xFF1A1A1A),
  onSurface: Colors.white,
  secondary: AppColors.primary,
  onSecondary: Colors.white,
  tertiary: AppColors.lightGray,
  onTertiary: AppColors.mediumGray,
  primaryContainer: const Color(0xFF2A2A2A),
  onPrimary: Colors.white,
);

void main() {
  // This makes the orientation of the device to be fixed
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {});
  runApp(
    // Wrap app with ProviderScope for Riverpod
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authData = ref.watch(authProvider);
    return MaterialApp(
      title: 'HandyMan',
      debugShowCheckedModeBanner: false,
      // setting the dark theme
      darkTheme: ThemeData.dark().copyWith(
        // setting the color scheme for the dark theme
        colorScheme: kDarkColorScheme,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Geist'),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            minimumSize: const Size(double.infinity, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            overlayColor: Colors.transparent,
          ),
        ),
      ),
      // setting the default theme which is the light theme
      theme: ThemeData().copyWith(
        // setting the color scheme for the light theme
        colorScheme: kColorScheme,
        textTheme: ThemeData.light().textTheme.apply(
          fontFamily: 'Geist',
          bodyColor: AppColors.darkText,
          displayColor: AppColors.darkText,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            minimumSize: const Size(double.infinity, 36),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            overlayColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
        ),
      ),
      home: authData != null ? const HomeScreen() : const FirstScreen(),
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const HomeScreen(),
      },
      // choosing theme based on the systems theme
      themeMode: ThemeMode.light,
    );
  }
}
