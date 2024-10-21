import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order_system/view/home_page.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{

  void initState() {
    super.initState();
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(seconds: 4), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 59, 80),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/util/loading_screen_util/logo_image.png",
              scale: 2,
            ),
            Image.asset("lib/util/loading_screen_util/loading_bar.gif")
          ],
        ),
      ),
    );
  }
}
