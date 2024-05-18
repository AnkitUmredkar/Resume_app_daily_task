import 'package:flutter/material.dart';
import 'package:resume_app_daily_task/Daily_Task/Dynamic%20TextField/global.dart';

class DisplaySkill extends StatefulWidget {
  const DisplaySkill({super.key});

  @override
  State<DisplaySkill> createState() => _DisplaySkillState();
}

class _DisplaySkillState extends State<DisplaySkill> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          toolbarHeight: 80,
          title: const Text(
            'Skills',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                txtControllerList.length,
                (index) => Text(
                  '${txtControllerList[index].text}\n ',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
