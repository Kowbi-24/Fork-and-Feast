import 'package:flutter/material.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowIcon(
          backgroundColor: Color.fromARGB(255, 5, 59, 80),
          iconColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
              "ABOUT US",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Welcome to the Fork & Feast App, your trusted companion for easy and convenient meal ordering! Our app allows you to skip the hassle of waiting in line by placing your orders ahead for pick-up or dine-in at our restaurant. Whether you\'re paying with cash, credit/debit card or GCash, we\'ve made it simple for you to enjoy your favorite meals on your terms.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 16),
            _buildCard(
              name: 'Cruz, Kobe',
              role: 'Leader',
              imageUrl: 'kobe.jpg',
            ),
            _buildCard(
              name: 'De Guzman, Kim Charles',
              role: 'Member',
              imageUrl: 'kim.jpg',
            ),
            _buildCard(
              name: 'De Jesus, Angelor',
              role: 'Member',
              imageUrl: 'angelor.jpg',
            ),
            _buildCard(
              name: 'Lapuz, Alfred Anthony',
              role: 'Member',
              imageUrl: 'alfred.png',
            ),
            _buildCard(
              name: 'Lee, Ashlee Jennifer',
              role: 'Member',
              imageUrl: 'ashlee.jpg',
            ),
            _buildCard(
              name: 'Turla, Djohn Paul',
              role: 'Member',
              imageUrl: 'djohn.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String name, required String role, required String imageUrl}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(role),
        leading: ClipPath(
          //clipper: DiamondClipper(),
          child: Image.asset("lib/images/grp_images/$imageUrl"),
        ),
      ),
    );
  }
}

class DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    path.moveTo(center.dx, center.dy - radius);
    path.lineTo(center.dx + radius, center.dy);
    path.lineTo(center.dx, center.dy + radius);
    path.lineTo(center.dx - radius, center.dy);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
