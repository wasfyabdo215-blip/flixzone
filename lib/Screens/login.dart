import 'package:flixzone/Screens/homepage.dart';
import 'package:flixzone/Screens/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Center(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image2.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(color: Colors.black.withOpacity(0.7)),
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      width: 400,
                      padding: EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'FLIX',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'ZONE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Welcome to FilxZone Universe.',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),

                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Email or Username',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.person, color: Colors.white54),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),

                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.lock, color: Colors.white54),
                              ),
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                            ),
                          ),

                          SizedBox(height: 20),

                          // Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Homepage()));

                                /*ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Signing in...')),
                                );*/
                              },
                              child: Text(
                                'sign in',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Register()),
                                  );
                                },
                                child: Text(


                                  'Create an Account',
                                  style: TextStyle(color: Colors.white70,fontSize: 15),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Text(
                            'Or sign in with:',
                            style: TextStyle(color: Colors.white70,fontSize: 20),
                          ),

                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialButton(
                                FontAwesomeIcons.google,
                                Colors.white,
                                Colors.red,
                              ),
                              SizedBox(width: 15),
                              _buildSocialButton(
                                Icons.facebook,
                                Colors.white,
                                Colors.blue,
                              ),
                              SizedBox(width: 15),
                              _buildSocialButton(
                                Icons.apple,
                                Colors.white,
                                Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color iconColor, Color bgColor) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }
}