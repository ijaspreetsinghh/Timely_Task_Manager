import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timely/constants.dart';
import 'schedule.dart';
import 'secondTab.dart';

class PagesDecider extends StatefulWidget {
  static const route = 'PagesDecider';
  @override
  _PagesDeciderState createState() => _PagesDeciderState();
}

class _PagesDeciderState extends State<PagesDecider> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _children = [
    Schedule(),
    SecondTab(),
    Text('reee'),
    Text('ram'),
    Text('rfe')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.add_rounded,
            size: 36,
          ),
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  child: new Wrap(
                    children: <Widget>[
                      new ListTile(
                          leading: new Icon(Icons.music_note),
                          title: new Text('Music'),
                          onTap: () => {}),
                      new ListTile(
                        leading: new Icon(Icons.videocam),
                        title: new Text('Video'),
                        onTap: () => {},
                      ),
                    ],
                  ),
                );
              })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 32,
              color: Colors.transparent,
            ),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Business',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: kGrayTextColor.withOpacity(.5),
        selectedItemColor: kPrimaryColor,
        iconSize: 24,
        onTap: _onItemTapped,
      ),
    );
  }
}
