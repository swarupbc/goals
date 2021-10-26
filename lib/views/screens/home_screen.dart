import 'package:flutter/material.dart';
import 'package:goals/views/screens/goals_screen.dart';
import 'package:goals/views/screens/todos_screen.dart';
import 'package:goals/views/utils/constant.dart';

class HomeScreen extends StatefulWidget {
  static String id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget _child = const GoalsScreen();
    switch (_index) {
      case 0:
        _child = const GoalsScreen();
        break;
      case 1:
        _child = const ToDosScreen();
        break;
    }

    return Scaffold(
      floatingActionButton: FittedBox(
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 15.0,
          ),
          color: Colors.green.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {},
          child: Text(
            _index == 0 ? 'New Goal' : 'Add Task',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: Text(
          _index == 0 ? "Goals" : "ToDos",
          style: kMainGreenHeadingStyle,
        ),
        centerTitle: false,
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
      ),
      endDrawer: const Drawer(),
      body: SafeArea(
        child: SizedBox.expand(
          child: _child,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newIndex) => setState(() => _index = newIndex),
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball),
            label: "Goals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "ToDos",
          ),
        ],
      ),
    );
  }
}
