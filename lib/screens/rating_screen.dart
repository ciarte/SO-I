import 'package:flutter/material.dart';

import 'screens.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  RatingScreenState createState() => RatingScreenState();
}

class RatingScreenState extends State<RatingScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Califica la Llamada',
              style: TextStyle(fontSize: 20.0),
            ),
            const Text(
              'La llamada ha tenido una duración de: ',
              style: TextStyle(fontSize: 20.0),
            ),
            const Text(
              '00:25:20',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 50.0,
                  icon: _rating >= 1
                      ? const Icon(
                          Icons.star,
                          color: Color(0xFF172983),
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Color(0xFF172983),
                        ),
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(
                              currentPageIndex: 0,
                            ),
                          ),
                        );
                      });
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: _rating >= 2
                      ? const Icon(
                          Icons.star,
                          color: Color(0xFF172983),
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Color(0xFF172983),
                        ),
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(
                              currentPageIndex: 0,
                            ),
                          ),
                        );
                      });
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: _rating >= 3
                      ? const Icon(
                          Icons.star,
                          color: Color(0xFF172983),
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Color(0xFF172983),
                        ),
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(
                              currentPageIndex: 0,
                            ),
                          ),
                        );
                      });
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: _rating >= 4
                      ? const Icon(
                          Icons.star,
                          color: Color(0xFF172983),
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Color(0xFF172983),
                        ),
                  onPressed: () {
                    setState(() {
                      _rating = 4;
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(
                              currentPageIndex: 0,
                            ),
                          ),
                        );
                      });
                    });
                  },
                ),
                IconButton(
                  iconSize: 50.0,
                  icon: _rating >= 5
                      ? const Icon(
                          Icons.star,
                          color: Color(0xFF172983),
                        )
                      : const Icon(
                          Icons.star_border,
                          color: Color(0xFF172983),
                        ),
                  onPressed: () {
                    setState(() {
                      _rating = 5;
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainScreen(
                              currentPageIndex: 0,
                            ),
                          ),
                        );
                      });
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
