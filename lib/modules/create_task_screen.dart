import 'package:assessment_task/shared/components/create_task_screen_components.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({Key? key}) : super(key: key);

  TextEditingController taskNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  List<String> category = [
    'Development',
    'Research',
    'Technology'
        'Design',
    'Backend',
    'Sports',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: 10, top: 10, end: 20),
                  child: SecondAppBar()),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 25, end: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CreateTaskRow(),
                    const SizedBox(
                      height: 15,
                    ),
                    TaskNameForm(taskNameController: taskNameController),
                    const SizedBox(
                      height: 30,
                    ),
                    const CategoryRow(),
                    const SizedBox(
                      height: 5,
                    ),
                    CategoryListView(category: category),
                    const SizedBox(
                      height: 25,
                    ),
                    DateForm(dateController: dateController),
                    const SizedBox(
                      height: 30,
                    ),
                    TimeForm(
                        startTimeController: startTimeController,
                        endTimeController: endTimeController),
                    const SizedBox(
                      height: 20,
                    ),
                    DiscriptionForm(
                        discriptionController: discriptionController),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(child: CreateButton()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
