import 'package:flutter/material.dart';

var listViewList = List<int>.generate(100, (i) => i + 1);
class BulidinfScaffold extends StatefulWidget {
  const BulidinfScaffold({Key? key}) : super(key: key);

  @override
  _BulidinfScaffoldState createState() => _BulidinfScaffoldState();
}
class _BulidinfScaffoldState extends State<BulidinfScaffold> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ListAndGridView(),
    ViewOfGrid(),
    SimpleTextScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List & Grid View"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.ac_unit),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sort),
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List View",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: "Grid"),
          BottomNavigationBarItem(icon: Icon(Icons.stay_primary_landscape), label: "View")
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class ListAndGridView extends StatefulWidget {
  const ListAndGridView({Key? key}) : super(key: key);

  @override
  _ListAndGridViewState createState() => _ListAndGridViewState();
}

class _ListAndGridViewState extends State<ListAndGridView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: listViewList.length,
      itemBuilder: (context, listViewList) {
        print(listViewList);
        return ListTile(
          title: Text("Title $listViewList"),
          subtitle: Text("Subtitle $listViewList"),
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue,
            radius: 30,
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        );
      },
    );
  }
}

class ViewOfGrid extends StatelessWidget {
  const ViewOfGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
           crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 4),
      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 1,
      // ),
      itemCount: 16,
      itemBuilder: (context, index) {
        print(index);
        return InkWell(
          child: Image.asset("assets/images/$index.jpg",
          fit: BoxFit.cover),
          onTap: (){print("Image tapped $index");},
        )
        ;
      },
    );
  }
}

class SimpleTextScreen extends StatelessWidget {
  const SimpleTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Center(
      child: Text(
        "Simple Text Screen",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ));
  }
}
