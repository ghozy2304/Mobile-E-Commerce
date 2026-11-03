import 'package:flutter/material.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/login_page.dart';
import 'package:e_commerce_app/pages/sign_up_page.dart';
import 'package:e_commerce_app/pages/account_page.dart';
import 'package:e_commerce_app/pages/change_pass_page.dart';
import 'package:e_commerce_app/pages/cart_page.dart';
import 'package:e_commerce_app/pages/list_chat.dart';
import 'package:e_commerce_app/pages/detail_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ElekShop - Toko Elektronik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          primary: const Color(0xFF2563EB),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1E293B),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Color(0xFF1E293B),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: const HomePage(),
      routes: {
        '/Home_page': (context) => const HomePage(),
        '/login_page': (context) => const LoginPage(),
        '/sign_up_page': (context) => const SignUpPage(),
        '/account_page': (context) => const AccountPage(),
        '/change_pass_page': (context) => const ChangePassPage(),
        '/cart_page': (context) => const CartPage(),
        '/listChat_page': (context) => const ListChatPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detailChat_page') {
          final args = settings.arguments as Map<String, dynamic>?;
          final contactName = args?['contactName'] as String? ?? 'Chat';
          return MaterialPageRoute(
            builder: (context) => ChatScreen(contactName: contactName),
          );
        }
        return null;
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [const Text('You have pushed the button this many times:')],
        ),
      ),
    );
  }
}
