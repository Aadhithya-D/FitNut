import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    void signUserOut() {
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthPage(),
          ));
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: const Color(0xFF222831),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 33),
              child: Column(
                children: [
                  Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.oswald(
                      color: const Color(0XFFEEEEEE),
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFF393E46),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Text('Aadhithya',
                                        style: GoogleFonts.oswald(
                                          color: Color(0XFFEEEEEE),
                                          fontSize: 30,
                                          fontWeight: FontWeight.normal,
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Weight',
                                                style: GoogleFonts.oswald(
                                                  color: Color(0XFFEEEEEE),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                            Text('75Kg',
                                                style: GoogleFonts.oswald(
                                                  color: Color(0XFFEEEEEE),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text('Height',
                                                style: GoogleFonts.oswald(
                                                  color: Color(0XFFEEEEEE),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                            Text('180cm',
                                                style: GoogleFonts.oswald(
                                                  color: Color(0XFFEEEEEE),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 110,
                                right: 20,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.logout,
                                    color: Color(0xFFEEEEEE),
                                  ),
                                  onPressed: signUserOut,
                                )),
                            const Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 90.0,
                                  backgroundImage: NetworkImage(
                                      "https://images.unsplash.com/photo-1661956602926-db6b25f75947?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=1600&q=60"),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF393E46),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text('My Scores',
                              style: GoogleFonts.oswald(
                                color: Color(0XFFEEEEEE),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          const Divider(
                            thickness: 2.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
