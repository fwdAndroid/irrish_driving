import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irrish_driving/screens/test_routes/google_map_routes.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                width: 300,
                height: 500,
                decoration: ShapeDecoration(
                  color: boxColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("centers")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text("No Routes Display Yet!"),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection("centers")
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final List<DocumentSnapshot> documents =
                                  snapshot.data!.docs;
                              final Map<String, dynamic> data = documents[index]
                                  .data() as Map<String, dynamic>;
                              return Card(
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Test Center Name:",
                                        style: TextStyle(
                                            color: colorBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(data['centerName']),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Test Center Location:",
                                        style: TextStyle(
                                            color: colorBlack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(data['testLocation']),
                                    ],
                                  ),
                                  trailing: TextButton(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    MapWithRoutes()));
                                      },
                                      child: Text("View Map")),
                                ),
                              );
                            });
                      },
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
