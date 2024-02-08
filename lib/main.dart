import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: MyAlertDialogDemo(),
      ),
    );
  }
}

class MyAlertDialogDemo extends StatefulWidget {
  const MyAlertDialogDemo({super.key});

  @override
  _MyAlertDialogDemoState createState() => _MyAlertDialogDemoState();
}

class _MyAlertDialogDemoState extends State<MyAlertDialogDemo> {
  Future<void> _showAlertDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Election 2020"),
          content: const Text("Will you vote for Trump?"),
          actions: [
            ElevatedButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop("Yes, Of course!"); // Return value
              },
            ),
            ElevatedButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context)
                    .pop("No, I will vote for Biden"); // Return value
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      print("User selected: $result");
    }
  }

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("My App"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_boat)),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context);
                },
                child: const Text("Show AlertDialog"),
              ),
              const SizedBox(height: 20), // Add some spacing
              Container(
                width: 350,
                // Adjust the height to ensure content fits without overflow
                height: 220, // Increased height to accommodate buttons
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.orange,
                  elevation: 10,
                  child: Padding(
                    padding:
                        const EdgeInsets.all(16.0), // Padding inside the card
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Use the space needed for the children only
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.album, size: 60),
                          title: Text(
                            "Sonu Nigam",
                            style:
                                TextStyle(fontSize: 24.0), // Reduced font size
                          ),
                          subtitle: Text(
                            "Best of Sonu Nigam Music",
                            style:
                                TextStyle(fontSize: 14.0), // Reduced font size
                          ),
                        ),
                        // Use a Flexible widget to prevent overflow
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlaying = true;
                                  });
                                },
                                child: const Text("Play"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlaying = false;
                                  });
                                },
                                child: const Text("Pause"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Мистер Твистер"),
                accountEmail: Text("home@dartflutter.ru"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "MT",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map),
                title: const Text('Map'),
                onTap: () {
                  // Navigation logic for Map
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text('Album'),
                onTap: () {
                  // Navigation logic for Album
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                onTap: () {
                  // Navigation logic for Phone
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text('Contact'),
                onTap: () {
                  // Navigation logic for Contact
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Setting'),
                onTap: () {
                  // Navigation logic for Setting
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}