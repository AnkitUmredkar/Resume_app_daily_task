import 'package:flutter/material.dart';
import 'package:resume_app_daily_task/Daily_Task/Dynamic%20TextField/global.dart';

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({super.key});

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          toolbarHeight: 80,
          title: const Text(
            'Dynamic TextField',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                txtControllerList.length,
                (index) => ListTile(
                  title: TextField(
                    controller: txtControllerList[index],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        if (txtControllerList.length > 1) {
                          txtControllerList.removeAt(index);
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  TextEditingController txtController = TextEditingController();
                  txtControllerList.add(txtController);
                });
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/displaySkill');
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
