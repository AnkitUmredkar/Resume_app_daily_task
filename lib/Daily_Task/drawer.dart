import 'package:flutter/material.dart';

import '../util/global.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF2E2F33),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: ListTile(
                  leading: Text(
                    'Gmail',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
              const Divider(color: Color(0xFF505153), thickness: 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 12;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: buildListTile(
                      Icons.all_inbox, 'All Inboxes', selectedIndex == 12),
                ),
              ),
              const Divider(color: Color(0xFF505153), thickness: 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 13;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child:
                      buildListTile(Icons.inbox, 'Inbox', selectedIndex == 13),
                ),
              ),
              const Divider(color: Color(0xFF505153), thickness: 2),
              ...List.generate(
                iconList.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: buildListTile(iconList[index], txtList[index],
                        selectedIndex == index),
                  ),
                ),
              ),
              const Divider(color: Color(0xFF505153), thickness: 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 10;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child:
                      buildListTile(Icons.add, 'Create', selectedIndex == 10),
                ),
              ),
              const Divider(color: Color(0xFF505153), thickness: 2),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 11;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: buildListTile(
                      Icons.settings, 'Setting', selectedIndex == 11),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListTile(var icon, String data, bool click) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    decoration: (click)
        ? const BoxDecoration(
            color: Color(0xFF745251),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(52),
              bottomRight: Radius.circular(52),
            ),
          )
        : null,
    child: ListTile(
      leading: Icon(
        icon,
        color: (click) ? const Color(0xFFE49486) : const Color(0xFFEEF0F3),
        size: 28,
      ),
      title: Text(
        data,
        style: TextStyle(
            color: (click) ? const Color(0xFFE49486) : const Color(0xFFEEF0F3),
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins'),
      ),
    ),
  );
}

List iconList = [
  Icons.star,
  Icons.schedule,
  Icons.label,
  Icons.send,
  Icons.drafts,
  Icons.mail_outline,
  Icons.error,
  Icons.delete_sweep,
];

List txtList = [
  'Started',
  'Snooze',
  'Important',
  'Sent',
  'Draft',
  'All Mail',
  'Spam',
  'Trash',
];
