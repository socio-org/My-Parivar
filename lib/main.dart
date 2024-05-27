import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mera_pariwar/hive/fav.dart';
import 'package:mera_pariwar/screens/auth/login.dart';
import 'package:mera_pariwar/themes/themes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FavPostDataAdapter());
  await Hive.openBox<FavPostData>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppTheme.blueColor,
        fontFamily: "Montserrat",
      ),
      home: const SafeArea(child: MyHomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isAuthenticated = true;

  @override
  void initState() {
    super.initState();
    // Simulate authentication check
    Future.delayed(const Duration(seconds: 5), () {
      // If authenticated, navigate to the main page
      if (isAuthenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        // If not authenticated, wait for 2 seconds then navigate to login page
        // Future.delayed(const Duration(seconds: 2), () {
        //   Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(builder: (context) => LoginPage()),
        //   );
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg/image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 146, 150, 172),
                  Color(0xFF101E5A),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    heightFactor: 0.4,
                    child: Center(
                      child: Image.asset(
                        'assets/logos/logo.png',
                        width: screenWidth * 0.6,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05),
                  child: const Column(
                    children: [
                      Text(
                        "Powered by",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "SOCIO",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
