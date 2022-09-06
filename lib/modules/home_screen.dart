import 'package:assessment_task/models/task_model.dart';
import 'package:assessment_task/shared/components/home_screen_components.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = [
      TaskModel(
          title: 'Team Meating',
          discription: 'Discuss all questions \nabout new projects',
          image:
              'https://media.istockphoto.com/vectors/business-meeting-illustration-vector-id1308949444?k=20&m=1308949444&s=612x612&w=0&h=AY1VF6FkzLPzA19yPWo3skg4HEyUMIC3gMZuKWx7uT8=',
          time: '10:00, AM'),
      TaskModel(
          title: 'Call The Stylist',
          discription: 'Agree on an evening \nlook',
          image:
              'https://cdn.iconscout.com/icon/free/png-256/call-2021585-1709472.png',
          time: '11:00, AM'),
      TaskModel(
          title: 'Check Mail',
          discription: 'Write to The Manager',
          image:
              'https://play-lh.googleusercontent.com/mVgXol6gGP21dOZDcowB98ttq-592tcZV7GEz6K8fEaKuySAkQTamNIkA4M4Q5SjGQ',
          time: '12:00, PM'),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.only(
                start: 20,
              ),
              child: MyAppbar(),
            ),
            const TopContainer(),
            SecondContainer(tasks: tasks)
          ],
        ),
      ),
    );
  }
}
