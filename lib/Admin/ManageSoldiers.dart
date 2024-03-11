import 'package:flutter/material.dart';

class Soldier {
  final String name;
  final String email;
  final String photoAsset;
  final String idProof;
  final int heartRate;

  Soldier({
    required this.name,
    required this.email,
    required this.photoAsset,
    required this.idProof,
    required this.heartRate,
  });
}

class SoldierManagement extends StatefulWidget {
  const SoldierManagement({Key? key}) : super(key: key);

  @override
  State<SoldierManagement> createState() => _SoldierManagementState();
}

class _SoldierManagementState extends State<SoldierManagement> {
  final List<Soldier> soldiers = [
    Soldier(
      name: 'Angel',
      email: 'john.doe@example.com',
      photoAsset: 'assets/images/avatar1.jpg',
      idProof: '1234567890',
      heartRate: 80,
    ),
    Soldier(
      name: 'Anandu',
      email: 'jane.smith@example.com',
      photoAsset: 'assets/images/avatar2.jpg',
      idProof: '0987654321',
      heartRate: 75,
    ),
    // Add more soldiers here...
  ];

  List<Soldier> filteredSoldiers = [];
  Soldier? selectedSoldier;

  @override
  void initState() {
    super.initState();
    filteredSoldiers = soldiers;
  }

  void filterSoldiers(String query) {
    setState(() {
      filteredSoldiers = soldiers
          .where((soldier) =>
          soldier.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text('Soldier Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SoldierSearchDelegate(soldiers),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[900]!, Colors.green[700]!],
          ),
        ),
        child: ListView.builder(
          itemCount: filteredSoldiers.length,
          itemBuilder: (context, index) {
            Soldier soldier = filteredSoldiers[index];
            bool isHighlighted = selectedSoldier == soldier;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSoldier = soldier;
                });
              },
              onDoubleTap: () {
                setState(() {
                  selectedSoldier = null;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: isHighlighted ? Colors.red : Colors.transparent,
                    width: 2,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.grey[200]!],
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Zoom in/out image: ${soldier.name}');
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            soldier.photoAsset,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            soldier.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            soldier.email,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'ID: ${soldier.idProof}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Heart Rate: ${soldier.heartRate} bpm',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            print('Removed soldier: ${soldier.name}');
                          },
                        ),
                        SizedBox(height: 8.0),
                        IconButton(
                          icon: Icon(Icons.block),
                          onPressed: () {
                            print('Blocked soldier: ${soldier.name}');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SoldierSearchDelegate extends SearchDelegate<Soldier> {
  final List<Soldier> soldiers;

  SoldierSearchDelegate(this.soldiers);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, soldiers.isNotEmpty ? soldiers.first : Soldier(
          name: '',
          email: '',
          photoAsset: '',
          idProof: '',
          heartRate: 0,
        ));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Soldier> suggestionList = query.isEmpty
        ? <Soldier>[]
        : soldiers
        .where((soldier) =>
        soldier.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (suggestionList.isEmpty && query.isNotEmpty) {
      return Center(
        child: Text('No soldier found'),
      );
    }

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        Soldier soldier = suggestionList[index];
        return ListTile(
          title: Text(soldier.name),
          onTap: () {
            close(context, soldier);
          },
        );
      },
    );
  }
}
