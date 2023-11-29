import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/test_routes/map_route.dart';
import 'package:irrish_driving/widgets/colors.dart';

class TestRoutes extends StatefulWidget {
  const TestRoutes({super.key});

  @override
  State<TestRoutes> createState() => _TestRoutesState();
}

class _TestRoutesState extends State<TestRoutes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Image.asset(
          "assets/logo.png",
          width: 250,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  width: 300,
                  height: 900,
                  decoration: ShapeDecoration(
                    color: boxColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart1',
                                          latitude: 25.125071,
                                          longitude: 55.214531,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1o2-eofdOsLZleSFa45g96FpylDrUJ2KD&ll=25.125071%2C55.214531&z=14",
                                        )));
                          },
                          title: Text("Mulhuddart1"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart2',
                                          latitude: 53.40392119409052,
                                          longitude: -6.398829999999998,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1ImsSNqlfJLM27VGPLHJdDmNsHDmsHCLJ&ll=53.40392119409052%2C-6.398829999999998&z=14",
                                        )));
                          },
                          title: Text("Mulhuddart2"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart3',
                                          latitude: 53.4032653811477,
                                          longitude: -6.408710000000006,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1Pl4eWK2XMPDqzZ4mtO9BZmUeIJGsDCje&ll=53.4032653811477%2C-6.408710000000006&z=15",
                                        )));
                          },
                          title: Text("Mulhuddart3"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart4',
                                          latitude: 53.396365484023015,
                                          longitude: -6.397051399999998,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1kmDFwaurXEMn2MhsOBnuzTsEnPEk5kBg&ll=53.396365484023015%2C-6.397051399999998&z=14",
                                        )));
                          },
                          title: Text("Mulhuddart4"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart5',
                                          latitude: 53.403756231088515,
                                          longitude: -6.4008000000000065,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1dQ-25B5cekrkzySt5pBzSoS82Up593M&ll=53.403756231088515%2C-6.4008000000000065&z=14",
                                        )));
                          },
                          title: Text("Mulhuddart5"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart6',
                                          latitude: 53.40389620001984,
                                          longitude: -6.384730000000005,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1BpFwsK3igmdPoKZz_rks5sdvjxzuXU0&ll=53.40389620001984%2C-6.384730000000005&z=14",
                                        )));
                          },
                          title: Text("Mulhuddart6"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Mulhuddart7',
                                          latitude: 53.40193664318724,
                                          longitude: -6.402671800000004,
                                          url:
                                              "https://google.com/maps/d/u/0/viewer?mid=1ZxZkni3yK6kiV1DUtnv14VYAn4fGbv8&ll=53.40193664318724%2C-6.402671800000004&z=14",
                                        )));
                          },
                          title: Text("Mulhuddart7"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 1',
                                          latitude: 53.21676057194104,
                                          longitude: -6.662864999999987,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1KpxY916Z1yzl_8RLtQynupLPbhcrtxAF&ll=53.21676057194104%2C-6.662864999999987&z=14",
                                        )));
                          },
                          title: Text("Naas 1"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 2',
                                          latitude: 53.21417535885368,
                                          longitude: -6.666004999999999,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1Uq-TBUvabSbA0H5CMGClIqX-W_LcMT0d&ll=53.21417535885368%2C-6.666004999999999&z=14",
                                        )));
                          },
                          title: Text("Naas 2"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 3',
                                          latitude: 53.213220040574264,
                                          longitude: -6.663604999999984,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1U4hdoautmuve6tSa0r2CS6SkhywIOKy5&ll=53.213220040574264%2C-6.663604999999984&z=15",
                                        )));
                          },
                          title: Text("Naas 3"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 4',
                                          latitude: 53.21524046031005,
                                          longitude: -6.665792650000015,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1rekivXGO7vSHFBVo8O1DUFbEGBtumCDb&ll=53.21524046031005%2C-6.665792650000015&z=14",
                                        )));
                          },
                          title: Text("Naas 4"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 5',
                                          latitude: 53.21189520244557,
                                          longitude: -6.667730000000001,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1RCRQsoFnth9uIVMP2FitzzlbRk9LsmTq&ll=53.21189520244557%2C-6.667730000000001&z=15",
                                        )));
                          },
                          title: Text("Naas 5"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 6',
                                          latitude: 53.21448027849746,
                                          longitude: -6.662864999999987,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=13RNBihVPD3CRlm1PFTF8Cdh5geIBDPUa&ll=53.21448027849746%2C-6.662864999999987&z=14",
                                        )));
                          },
                          title: Text("Naas 6"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MapWidget(
                                          title: 'Naas 7',
                                          latitude: 53.20750889629692,
                                          longitude: -6.669755000000004,
                                          url:
                                              "https://www.google.com/maps/d/u/0/viewer?mid=1Zm4Waj6C7cjuKOA6dyXJFeSU3MDblp2e&ll=53.20750889629692%2C-6.669755000000004&z=13",
                                        )));
                          },
                          title: Text("Naas 7"),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
